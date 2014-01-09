#include "osm2nav.h"
#include <stdio.h>
#include <iostream>
#include <boost/lexical_cast.hpp>

#include "osm_tags_reader.h"
#include "georef/georef.h"
#include "georef/adminref.h"
#include "utils/functions.h"

namespace ed { namespace connectors {

void Visitor::node_callback(uint64_t osmid, double lon, double lat, const CanalTP::Tags & tags){
    Node node;
    node.coord.set_lat(lat);
    node.coord.set_lon(lon);
    node.ref_node = osmid;
    this->nodes[osmid] = node;
    add_osm_housenumber(osmid, tags);
    add_osm_poi(node.coord, tags);
}

void Visitor::way_callback(uint64_t osmid, const CanalTP::Tags &tags, const std::vector<uint64_t> &refs){
    total_ways++;

    OSMWay w;
    w.refs = refs;
    w.properties = parse_way_tags(tags);
    // Est-ce que au moins une propriété fait que la rue est empruntable (voiture, vélo, piéton)
    // Alors on le garde comme way navitia
    if(w.properties.any()){
        navitia::georef::Way* gr_way;
        gr_way->idx = geo_ref.ways.size();
        gr_way->uri = std::to_string(osmid);
        if(tags.find("name") != tags.end())
            gr_way->name = tags.at("name");
        geo_ref.ways.push_back(gr_way);
        w.idx = gr_way->idx;
    }else{
        // Dans le cas où la maison est dessinée par un way et non pas juste par un node
        add_osm_housenumber(refs.front(), tags);
        navitia::type::GeographicalCoord coord;
        add_osm_poi(coord, tags);
    }
    ways[osmid] = w;
}

void Visitor::relation_callback(uint64_t osmid, const CanalTP::Tags & tags, const CanalTP::References & refs){
    references[osmid] = refs;
    if(tags.find("admin_level") != tags.end()){
        iter= levellist.LevelList.find(tags.at("admin_level"));
        if (iter != levellist.LevelList.end()){
            OSMAdminRef inf;
            inf.level = tags.at("admin_level");
            if(tags.find("ref:INSEE") != tags.end()){
                inf.insee = tags.at("ref:INSEE");
            }
            if(tags.find("name") != tags.end()){
                inf.name = tags.at("name");
            }
            if(tags.find("addr:postcode") != tags.end()){
                inf.postcode = tags.at("addr:postcode");
            }
            inf.refs = refs;
            OSMAdminRefs[osmid]=inf;
        }
    }
}


void Visitor::add_osm_housenumber(uint64_t osmid, const CanalTP::Tags & tags){
    if(tags.find("addr:housenumber") != tags.end()){
        OSMHouseNumber osm_hn;
        osm_hn.number = str_to_int(tags.at("addr:housenumber"));
        if (osm_hn.number > 0 ){
            this->housenumbers[osmid] = osm_hn;
        }
    }
}

void Visitor::add_osm_poi(const navitia::type::GeographicalCoord& coord, const CanalTP::Tags & tags){
    if(tags.find(poilist.poi_key) != tags.end()){
        std::string value = "POITYPE:"+tags.at(poilist.poi_key);
        bool to_add = true;
        std::string name;
        auto it = geo_ref.poitype_map.find(value);
        if(it != geo_ref.poitype_map.end()){
            if(coord.is_default_coord()){ /// dans le cas où le POI n'a pas de coordonées, ne pas l'importer
              LOG4CPLUS_WARN(logger, "Attention, le site ayant comme type ["+value+"] n'est pas importé car il n'a pas de coordonnées.");
              to_add = false;
            }else{
                if(tags.find("name") == tags.end()){ /// dans le cas où le POI n'a pas de nom, ne pas l'importer si ce n'est pas station VLS
                    if (value != "POITYPE:"+poilist.vls){
                        LOG4CPLUS_WARN(logger, "Attention, le site ayant comme type ["+value+"] n'est pas importé car il n'a pas de nom.");
                        to_add = false;
                    }
                }else{
                    name = tags.at("name");
                }
            }
            if (to_add){
                navitia::georef::POI* poi = new navitia::georef::POI();
                poi->poitype_idx = it->second;
                poi->coord = coord;
                poi->idx = geo_ref.pois.size();
                poi->uri = "POI:"+ boost::lexical_cast<std::string>(poi->idx);
                poi->name = name;
                if (value == "POITYPE:"+poilist.vls){
                    poi->visible = false;
                }
                geo_ref.pois.push_back(poi);
            }
        }
    }
}

void Visitor::count_nodes_uses() {
    int node_idx = 0;
    for(const auto & w : ways){
        if(w.second.properties.any()) {
            for(uint64_t ref : w.second.refs){
                if(nodes[ref].increment_use(node_idx)){
                    navitia::georef::Vertex v;
                    node_idx++;
                    v.coord = nodes[ref].coord;
                    boost::add_vertex(v, geo_ref.graph);
                }
            }

            uint64_t ref = w.second.refs.front();
            // make sure that the last node is considered as an extremity
            if(nodes[ref].increment_use(node_idx)){
                node_idx++;
                navitia::georef::Vertex v;
                v.coord =  nodes[ref].coord;
                boost::add_vertex(v, geo_ref.graph);
            }

            ref = w.second.refs.back();
            if(nodes[ref].increment_use(node_idx)){
                node_idx++;
                navitia::georef::Vertex v;
                v.coord =  nodes[ref].coord;
                boost::add_vertex(v, geo_ref.graph);
            }
        }
    }
    geo_ref.init();
    std::cout << "On a : " << boost::num_vertices(geo_ref.graph) << " nœuds" << std::endl;
}

void Visitor::edges(){
    for(const auto & w : ways){
        if(w.second.properties.any() && w.second.refs.size() > 0){
            Node n = nodes[w.second.refs[0]];
            navitia::type::idx_t source = n.idx;
            navitia::type::GeographicalCoord prev = n.coord;
            float length = 0;
            for(size_t i = 1; i < w.second.refs.size(); ++i){
                Node current_node = nodes[w.second.refs[i]];
                navitia::type::GeographicalCoord current = current_node.coord;
                length += current.distance_to(prev);
                prev = current;
                // If a node is used more than once, it is an intersection, hence it's a node of the street network graph
                try{
                    if(current_node.uses > 1){
                        navitia::type::idx_t target = current_node.idx;
                        navitia::georef::Edge e;
                        e.way_idx = w.second.idx;
                        e.duration = boost::posix_time::seconds(length / navitia::georef::default_speed[navitia::type::Mode_e::Walking]);
                        boost::add_edge(source, target, e, geo_ref.graph);
                        if(w.second.properties[CYCLE_FWD]){ // arc cyclable
                            e.duration = boost::posix_time::seconds(length / navitia::georef::default_speed[navitia::type::Mode_e::Bike]);
                            boost::add_edge(source + geo_ref.offsets[navitia::type::Mode_e::Bike], target + geo_ref.offsets[navitia::type::Mode_e::Bike], e, geo_ref.graph);
                        }
                        if(w.second.properties[CAR_FWD]){ // arc accessible en voiture
                            e.duration = boost::posix_time::seconds(length / navitia::georef::default_speed[navitia::type::Mode_e::Car]);
                            boost::add_edge(source + geo_ref.offsets[navitia::type::Mode_e::Car], target + geo_ref.offsets[navitia::type::Mode_e::Car], e, geo_ref.graph);
                        }
                        geo_ref.ways[e.way_idx]->edges.push_back(std::make_pair(source, target));

                        e.duration = boost::posix_time::seconds(length / navitia::georef::default_speed[navitia::type::Mode_e::Walking]);
                        boost::add_edge(target, source, e, geo_ref.graph);
                        if(w.second.properties[CYCLE_BWD]){ // arc cyclable
                            e.duration = boost::posix_time::seconds(length / navitia::georef::default_speed[navitia::type::Mode_e::Bike]);
                            boost::add_edge(target + geo_ref.offsets[navitia::type::Mode_e::Bike], source + geo_ref.offsets[navitia::type::Mode_e::Bike], e, geo_ref.graph);
                        }
                        if(w.second.properties[CAR_BWD]){ // arc accessible en voiture
                            e.duration = boost::posix_time::seconds(length / navitia::georef::default_speed[navitia::type::Mode_e::Car]);
                            boost::add_edge(target + geo_ref.offsets[navitia::type::Mode_e::Car], source + geo_ref.offsets[navitia::type::Mode_e::Car], e, geo_ref.graph);
                        }
                        geo_ref.ways[e.way_idx]->edges.push_back(std::make_pair(target, source));
                        source = target;
                        length = 0;
                    }
                }catch(...){
                    LOG4CPLUS_WARN(logger, "L'arc n'est pas importée car la rue : [" + std::to_string(w.first) + "] n'existe pas.");
                }
            }
        }
    }
    std::cout << "On a " << boost::num_edges(geo_ref.graph) << " arcs" << std::endl;
}

void Visitor::build_vls_edges(){
    auto it = geo_ref.poitype_map.find("POITYPE:"+poilist.vls);
    if(it != geo_ref.poitype_map.end()){
        for(const navitia::georef::POI* poi : geo_ref.pois){
            if (it->second == poi->poitype_idx){
                navitia::georef::vertex_t u = geo_ref.nearest_vertex(poi->coord, geo_ref.pl);
                navitia::georef::edge_t e = geo_ref.nearest_edge(poi->coord, u);
                navitia::georef::Edge edge;
                edge.way_idx = geo_ref.graph[e].way_idx;
                edge.duration = boost::posix_time::seconds(120); // time needed to take the bike
                boost::add_edge(u + geo_ref.offsets[navitia::type::Mode_e::Walking], u + geo_ref.offsets[navitia::type::Mode_e::Bike], edge, geo_ref.graph);
                edge.duration = boost::posix_time::seconds(180); // time needed to hang the bike back
                boost::add_edge(u + geo_ref.offsets[navitia::type::Mode_e::Bike], u + geo_ref.offsets[navitia::type::Mode_e::Walking], edge, geo_ref.graph);
                ++total_vls_stations;
            }
        }
    }
    LOG4CPLUS_INFO(logger, "nb added VLS stations : " << total_vls_stations);
}

void Visitor::HouseNumbers(){
    navitia::type::idx_t idx;
    navitia::type::idx_t Count = 0; // Nombre d'adresses non importées
    navitia::georef::HouseNumber gr_hn;
    for(auto hn : housenumbers){
        try{
            Node n = nodes[hn.first];
            if ((n.coord.lon() == 0) && (n.coord.lat())){
                ++Count;
            }else{
                gr_hn.number = hn.second.number;
                gr_hn.coord.set_lon(n.coord.lon());
                gr_hn.coord.set_lat(n.coord.lat());
                idx = geo_ref.graph[geo_ref.nearest_edge(gr_hn.coord)].way_idx;
                if (idx <= geo_ref.ways.size()){
                    geo_ref.ways[idx]->add_house_number(gr_hn);
                    total_house_number ++;
                } // Message ?
            }
        } catch(navitia::proximitylist::NotFound) {
            LOG4CPLUS_WARN(logger, "Attention, l'adresse n'est pas importée dont le numéro et les coordonnées sont : [" << gr_hn.number<<";"<< gr_hn.coord.lon()<< ";"<< gr_hn.coord.lat()<< "] Impossible de trouver le segment le plus proche.");
            ++Count;
        }catch(...){
            LOG4CPLUS_WARN(logger, "Attention, l'adresse n'est pas importée dont le numéro et les coordonnées sont : [" << gr_hn.number<<";"<< gr_hn.coord.lon()<< ";"<< gr_hn.coord.lat()<< "].");
            ++Count;
        }
    }
    std::cout<<"Nombre d'adresses non importées : "<<Count<<"/"<<housenumbers.size()<<std::endl;
}

navitia::type::GeographicalCoord Visitor::admin_centre_coord(const CanalTP::References & refs){
    navitia::type::GeographicalCoord best;
    for(CanalTP::Reference ref : refs){
        if (ref.member_type == OSMPBF::Relation_MemberType_NODE){
            try{
                Node n = nodes[ref.member_id];
                best.set_lon(n.coord.lon());
                best.set_lat(n.coord.lat());
                break;
            }catch(...){
                LOG4CPLUS_WARN(logger, "Attention, le nœud  : [" << ref.member_id<< " est introuvable].");
            }
        }
    }
    return best;
}


void Visitor::manage_admin_boundary(const CanalTP::References & refs, navitia::georef::Admin* admin){
    std::vector<uint64_t> vec_id =  nodes_of_relation(refs);

    // Fermer le polygon ci ce n'est pas le cas:
    if (vec_id.front() != vec_id.back()){
        vec_id.push_back(vec_id.front());
    }

    for (auto osm_node_id : vec_id){
        // Dans certaines données, un way peut faire référence à un Node qui n'est pas dans les données
        try{
            const Node & node = this->nodes.at(osm_node_id);
            //Il ne faut pas ajouter le Node dont le coord est vide.
            if (node.coord.lat() != 0 || node.coord.lon() != 0){
                boost::geometry::append(admin->boundary, node.coord);
            }

        } catch(...) {
        }
    }
}

/// à partir des références d'une relation, reconstruit la liste des identifiants OSM ordonnés
std::vector<uint64_t> Visitor::nodes_of_relation(const CanalTP::References & refs){
    std::vector<uint64_t> result;

    //Le vector pour tracer l'index du ref qui a été ajouté
    std::vector<bool> added(refs.size(), false);

    for(size_t i = 0; i < refs.size(); ++i) {//Il faut itérer au n² fois pour être sur d'avoir vu tous les cas
        for(size_t j = 0; j < refs.size(); ++j) {
            if(!added[j]) {
                CanalTP::Reference ref = refs[j];

                // étape 1 :  on récupère la liste des id OSM des nœuds de la référence
                std::vector<uint64_t> current_nodes;
                if (ref.member_type == OSMPBF::Relation_MemberType_WAY){
                    auto osmway_it = ways.find(ref.member_id);
                    if(osmway_it == ways.end()){
                        LOG4CPLUS_WARN(logger, "Rue introuvable :"+ std::to_string(ref.member_id));
                    } else {
                        current_nodes = osmway_it->second.refs;
                    }
                }
                else if (ref.member_type == OSMPBF::Relation_MemberType_RELATION && ref.role != "subarea"){
                    current_nodes = nodes_of_relation(references.at(ref.member_id));
                }

                if (!current_nodes.empty()){
                    // étape 2 : est-ce les nœuds courants "suivent" les nœuds existants
                    // si result est vide, on ajoute tout
                    if(result.empty()) {
                        result = current_nodes;
                        added[j] = true;
                    } else if (result.back() == current_nodes.front()) { // Si les current sont dans le bon sens
                        result.insert(result.end(), current_nodes.begin() + 1, current_nodes.end()); // +1 pour pas avoir de doublons
                        added[j] = true;
                    } else if(result.back() == current_nodes.back()) { // Current est inversé
                        result.insert(result.end(), current_nodes.rbegin() + 1, current_nodes.rend());
                        added[j] = true;
                    } // Sinon c'est current nodes doit être inséré à un autre moment
                }
            }
        }
    }
    return result;
}


void Visitor::AdminRef(){
    for(auto ar : OSMAdminRefs){
        navitia::georef::Admin* admin;
        admin->insee = ar.second.insee;
        admin->idx = geo_ref.admins.size();
        admin->post_code = ar.second.postcode;
        admin->name = ar.second.name;
        admin->level = boost::lexical_cast<int>( ar.second.level);
        admin->coord = admin_centre_coord(ar.second.refs);
        admin->id = boost::lexical_cast<std::string>(ar.first);
        manage_admin_boundary(ar.second.refs, admin);
        geo_ref.admins.push_back(admin);
    }
}

void Visitor::set_admin_of_ways(){
    for(navitia::georef::Way* way : geo_ref.ways){
        navitia::type::GeographicalCoord coord = way->barycentre(geo_ref.graph);
        std::vector<navitia::type::idx_t> vect_idx = geo_ref.find_admins(coord);
        std::sort(vect_idx.begin(), vect_idx.end(),[&](navitia::type::idx_t idx1, navitia::type::idx_t idx2)
        {return geo_ref.admins[idx1]->level > geo_ref.admins[idx2]->level;});
        for(navitia::type::idx_t id : vect_idx){
            way->admin_list.push_back(geo_ref.admins[id]);
        }
    }
}
void Visitor::fillPoiType(){
    for(auto pt : poilist.PoiList){
        navitia::georef::POIType* poitype = new navitia::georef::POIType();
        poitype->name = pt.second;
        poitype->idx = geo_ref.poitypes.size();
        poitype->uri = "POITYPE:"+pt.first;
        geo_ref.poitypes.push_back(poitype);
    }
    geo_ref.build_poitypes();
}

void fill_from_osm(navitia::georef::GeoRef & geo_ref_to_fill, const std::string & osm_pbf_filename){
    Visitor v(geo_ref_to_fill);
    v.fillPoiType();
    CanalTP::read_osm_pbf(osm_pbf_filename, v);
    v.geo_ref.build_pois();
    std::cout << v.nodes.size() << " nodes, " << v.ways.size() << " ways/" << v.total_ways << std::endl;
    v.count_nodes_uses();
    v.edges();
    std::cout<<"Construction de proximitylist"<<std::endl;
    v.geo_ref.build_proximity_list();
    std::cout<<"Construction du graphe VLS"<<std::endl;
    v.build_vls_edges();
    std::cout<<"Chargement des adresses"<<std::endl;
    v.HouseNumbers();
    std::cout<<"Chargement des données administratives"<<std::endl;
    v.AdminRef();
    std::cout<<"Chargement des données administratives des adresses"<<std::endl;
    geo_ref_to_fill.build_rtree();
    v.set_admin_of_ways();
    std::cout << "On a : " << v.total_house_number << " adresses" << std::endl;
    std::cout << "On a : " << v.geo_ref.admins.size() << " données administratives" << std::endl;
    std::cout << "On a : " << v.geo_ref.poitypes.size() << " types de site" << std::endl;
    std::cout << "On a : " << v.geo_ref.pois.size() << " sites" << std::endl;
    std::cout << "On a : " << v.total_vls_stations << " stations vls" << std::endl;

}

}}

