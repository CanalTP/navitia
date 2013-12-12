#include "osm2ed.h"
#include <stdio.h>

#include <iostream>

#include "ed/connectors/osm_tags_reader.h"
#include "utils/functions.h"
#include "utils/init.h"

#include "config.h"
#include <boost/program_options.hpp>

namespace po = boost::program_options;
namespace pt = boost::posix_time;

namespace ed { namespace connectors {

void Visitor::node_callback(uint64_t osmid, double lon, double lat, const CanalTP::Tags & tags){
    Node node;
    node.set_coord(lon,lat);
    this->nodes[osmid] = node;
    add_osm_housenumber(osmid, tags);
    fill_pois(osmid, tags);
}

void Visitor::way_callback(uint64_t osmid, const CanalTP::Tags &tags, const std::vector<uint64_t> &refs){
    total_ways++;

    OSMWay w;
    // On ignore les ref vers les nœuds qui ne sont pas dans les données
    for(auto ref : refs){
        if(this->nodes.find(ref) != this->nodes.end())
            w.refs.push_back(ref);
    }
    w.properties = parse_way_tags(tags);
    // Est-ce que au moins une propriété fait que la rue est empruntable (voiture, vélo, piéton)
    // Alors on le garde comme way navitia
    if(w.properties.any()){
        std::string name;
        if(tags.find("name") != tags.end())
            name = tags.at("name");
        this->lotus.insert({std::to_string(osmid), name, std::to_string(osmid)});
    }else{
        // Dans le cas où la maison est dessinée par un way et non pas juste par un node
        add_osm_housenumber(refs.front(), tags);
        fill_pois(refs.front(), tags);
    }
    ways[osmid] = w;
}

void Visitor::relation_callback(uint64_t osmid, const CanalTP::Tags & tags, const CanalTP::References & refs){
    references[osmid] = refs;
    const auto tmp_admin_level = tags.find("admin_level") ;
    if(tmp_admin_level != tags.end()){
        OSMAdminRef inf;
        inf.level = tmp_admin_level->second;

        std::vector<std::string> accepted_levels{"8", "9", "10"};
        if(std::find(accepted_levels.begin(), accepted_levels.end(), inf.level) != accepted_levels.end()){
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
    } else {
        std::cout << "Unable to find tag admin_level" << std::endl;
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


void Visitor::insert_if_needed(uint64_t ref) {
    const auto tmp_node = nodes.find(ref);
    if(tmp_node != nodes.end()) {
        Node & n = tmp_node->second;
        if(n.increment_use(this->node_idx)){
            this->node_idx++;
            std::string line = "POINT(" + std::to_string(n.lon()) + " " + std::to_string(n.lat()) + ")";
            this->lotus.insert({std::to_string(ref), line});
        }
    } else {
        std::cout << "Unable to find node " << ref << std::endl;
    }
}


void Visitor::count_nodes_uses() {
    this->lotus.prepare_bulk_insert("georef.node", {"id", "coord"});

    for(const auto & w : ways){
        if(w.second.properties.any()) {
            for(uint64_t ref : w.second.refs){
                this->insert_if_needed(ref);
            }

            if(w.second.refs.size() > 0) {
                // make sure that the last node is considered as an extremity
                this->insert_if_needed(w.second.refs.front());
                this->insert_if_needed(w.second.refs.back());
            }
        }

    }

    lotus.finish_bulk_insert();
}

void Visitor::insert_edges(){
    this->lotus.prepare_bulk_insert("georef.edge", {"source_node_id", "target_node_id", "way_id", "the_geog", "pedestrian_allowed", "cycles_allowed", "cars_allowed"});
    std::stringstream geog;
    geog << std::cout.precision(10);

    for(const auto & w : ways){
        if(w.second.properties.any()){
            uint64_t source = 0;
            geog.str("");
            geog << "LINESTRING(";

            for(size_t i = 0; i < w.second.refs.size(); ++i){
                uint64_t current_ref = w.second.refs[i];
                const auto tmp_node = nodes.find(current_ref);
                if(tmp_node != nodes.end()) {
                    Node current_node = tmp_node->second;

                    if(i > 0) geog << ", ";
                    geog << current_node.lon() << " " << current_node.lat();

                    if(i == 0) {
                        source = current_ref;
                    }
                    // If a node is used more than once, it is an intersection, hence it's a node of the street network graph
                    else if(current_node.uses > 1){
                        uint64_t target = current_ref;
                        // TODO : gérer les modes
                        geog << ")";
                        this->lotus.insert({std::to_string(source), std::to_string(target), std::to_string(w.first), geog.str(),
                                           std::to_string(w.second.properties[FOOT_FWD]), std::to_string(w.second.properties[CYCLE_FWD]), std::to_string(w.second.properties[CAR_FWD])});
                        this->lotus.insert({std::to_string(target), std::to_string(source), std::to_string(w.first), geog.str(),
                                           std::to_string(w.second.properties[FOOT_BWD]), std::to_string(w.second.properties[CYCLE_BWD]), std::to_string(w.second.properties[CAR_BWD])});
                        source = target;
                        geog.str("");
                        geog << "LINESTRING(" << current_node.lon() << " " << current_node.lat();
                    }
                } else {
                    std::cout << "Unable to find node " << current_ref << std::endl;
                }
            }
        }
    }
    lotus.finish_bulk_insert();
}


void Visitor::insert_house_numbers(){
    this->lotus.prepare_bulk_insert("georef.house_number", {"coord", "number", "left_side"});
    for(auto hn : housenumbers) {
        const auto tmp_node = nodes.find(hn.first);
        if(tmp_node != nodes.end()) {
            Node n = tmp_node->second;
            std::string point = "POINT(" + std::to_string(n.lon()) + " " + std::to_string(n.lat()) + ")";
            this->lotus.insert({point, std::to_string(hn.second.number), std::to_string(hn.second.number % 2 == 0)});
        } else {
            std::cout << "Unable to find node " << hn.first << std::endl;
        }
    }
    lotus.finish_bulk_insert();
}

navitia::type::GeographicalCoord Visitor::admin_centre_coord(const CanalTP::References & refs){
    navitia::type::GeographicalCoord best;
    for(CanalTP::Reference ref : refs){
        if (ref.member_type == OSMPBF::Relation_MemberType_NODE){
            const auto tmp_node = nodes.find(ref.member_id);
            if(tmp_node != nodes.end()) {
                Node n = tmp_node->second;
                best.set_lon(n.lon());
                best.set_lat(n.lat());
                break;
            }else{
                std::cout << "Unable to find node" << ref.member_id << std::endl;
            }
        }
    }
    return best;
}


std::string Visitor::geometry_of_admin(const CanalTP::References & refs) const{
    std::vector<uint64_t> vec_id = nodes_of_relation(refs);
    if(vec_id.size() < 3)
        return "";

    // Fermer le polygon si ce n'est pas le cas:
    if (vec_id.front() != vec_id.back()){
        vec_id.push_back(vec_id.front());
    }

    std::string geom("POLYGON((");
    std::string sep = "";

    for (auto osm_node_id : vec_id){

        const Node & node = this->nodes.at(osm_node_id);
        geom += sep + std::to_string(node.lon()) + " " + std::to_string(node.lat());
        sep = ",";
    }
    geom += "))";
    return geom;
}

/// à partir des références d'une relation, reconstruit la liste des identifiants OSM ordonnés
std::vector<uint64_t> Visitor::nodes_of_relation(const CanalTP::References & refs) const {
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
                    } else {
                        current_nodes = osmway_it->second.refs;
                    }
                }
                else if (ref.member_type == OSMPBF::Relation_MemberType_RELATION && ref.role != "subarea"){
                    const auto tmp_ref = references.find(ref.member_id);
                    if(tmp_ref != references.end()) {
                        current_nodes = nodes_of_relation(tmp_ref->second);
                    } else {
                        std::cout << "Unable to find reference " << std::endl;
                    }
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


void Visitor::insert_admin(){
    this->lotus.prepare_bulk_insert("navitia.admin", {"id", "name", "post_code", "insee", "level", "coord", "boundary", "uri"});
    int ignored = 0;
    for(auto ar : OSMAdminRefs){
        auto admin = ar.second;
        std::string polygon = this->geometry_of_admin(admin.refs);
        if(!polygon.empty()){
            std::string coord = "POINT(" + std::to_string(admin.coord.lon()) + " " + std::to_string(admin.coord.lat()) + ")";
            this->lotus.insert({std::to_string(ar.first), admin.name, admin.postcode, admin.insee, admin.level, coord,polygon , std::to_string(ar.first)});
        } else {
            ignored++;
        }
    }
    this->lotus.finish_bulk_insert();
    std::cout << " Admin ignorés : " << ignored << " sur " << OSMAdminRefs.size() << std::endl;
}

void Visitor::insert_poitypes(){
    this->lotus.prepare_bulk_insert("navitia.poi_type", {"id", "uri", "name"});
    for(auto pt : poi_types){
        this->lotus.insert({std::to_string(pt.second.idx), pt.second.uri, pt.second.name});
    }
    lotus.finish_bulk_insert();
}

void Visitor::insert_pois(){
    this->lotus.prepare_bulk_insert("navitia.poi", {"id","weight","coord", "name", "uri", "poi_type_id"});
    int32_t count =0;
    for(auto poi : pois){
        try{
            Node n = nodes.at(poi.first);
            count++;
            std::string point = "POINT(" + std::to_string(n.lon()) + " " + std::to_string(n.lat()) + ")";
            this->lotus.insert({std::to_string(count),std::to_string(poi.second.weight), point, poi.second.name, poi.second.uri,std::to_string(poi.second.poitype_idx)});
        }catch(...){
            std::cout << "Attention, le noued  : [" << poi.first << " est introuvable]." << std::endl;
        }
    }
    lotus.finish_bulk_insert();
}

void Visitor::clean_georef(){
    PQclear(this->lotus.exec("truncate georef.node, georef.house_number, navitia.admin, georef.way, navitia.poi_type CASCADE;"));
}

void Visitor::build_ways(){
    /// Ajout un nom pour le communes ayant un nom vide
    PQclear(this->lotus.exec("SELECT georef.add_way_name();", "", PGRES_TUPLES_OK));
    /// Fusion des voies par nom et commune
    PQclear(this->lotus.exec("SELECT georef.fusion_ways_by_admin_name();", "", PGRES_TUPLES_OK));
    /// Déplacement des relations admin,voie  de façon à ce que le couple (admin, voie) soit unique
    PQclear(this->lotus.exec("SELECT georef.insert_tmp_rel_way_admin();", "", PGRES_TUPLES_OK));
    /// MAJ des way_id dans la table edge
    PQclear(this->lotus.exec("SELECT georef.update_edge();", "", PGRES_TUPLES_OK));
    ///  Ajout des voies qui ne sont pas dans la table de fusion : cas voie appartient à un seul admin avec un level 9
    PQclear(this->lotus.exec("SELECT georef.complate_fusion_ways();", "", PGRES_TUPLES_OK));
    /// Ajout des voies n'ayant pas de communes dans la table de fusion
    PQclear(this->lotus.exec("SELECT georef.add_fusion_ways();", "", PGRES_TUPLES_OK));
    /// Ecrasement des données de la table 'rel_way_admin' par 'tmp_rel_way_admin'
    PQclear(this->lotus.exec("SELECT georef.insert_rel_way_admin();", "", PGRES_TUPLES_OK));
    /// Suppression des doublons de la atbles des voies
    PQclear(this->lotus.exec("SELECT georef.clean_way();", "", PGRES_TUPLES_OK));
    /// MAJ des way_id de la table des adresses
    PQclear(this->lotus.exec("SELECT georef.update_house_number();", "", PGRES_TUPLES_OK));
    /// Remise des noms des rues à vide qui étaient initialement vides
    PQclear(this->lotus.exec("SELECT georef.clean_way_name();", "", PGRES_TUPLES_OK));
    /// MAJ des coordonées des admins qui n'ont pas de coordonnées : Calcul du barycentre de l'admin
    PQclear(this->lotus.exec("SELECT navitia.update_admin_coord();", "", PGRES_TUPLES_OK));
    /// Relation entre les admins
    PQclear(this->lotus.exec("SELECT navitia.match_admin_to_admin();", "", PGRES_TUPLES_OK));
}

void Visitor::build_relation(){
    PQclear(this->lotus.exec("SELECT georef.match_stop_area_to_admin()", "", PGRES_TUPLES_OK));
    PQclear(this->lotus.exec("SELECT georef.match_stop_point_to_admin();", "", PGRES_TUPLES_OK));
    PQclear(this->lotus.exec("SELECT georef.match_way_to_admin();", "", PGRES_TUPLES_OK));
    PQclear(this->lotus.exec("SELECT georef.match_poi_to_admin();", "", PGRES_TUPLES_OK));
}

void Visitor::fill_PoiTypes(){
    poi_types["college"] = OSMPOIType(0, "college", "école");
    poi_types["university"] = OSMPOIType(1, "university", "université");
    poi_types["theatre"] = OSMPOIType(2, "theatre", "théâtre");
    poi_types["hospital"] = OSMPOIType(3, "hospital", "hôpital");
    poi_types["post_office"] = OSMPOIType(4, "post_office", "bureau de poste");
    poi_types["bicycle_rental"] = OSMPOIType(5, "bicycle_rental", "station vls", false);
}

void Visitor::fill_pois(const uint64_t osmid, const CanalTP::Tags & tags){
    if(tags.find("amenity") != tags.end()){
        std::string value = tags.at("amenity");
        auto it = poi_types.find(value);
        if(it != poi_types.end()){
            OSMPOI poi;
            poi.poitype_idx = it->second.idx;
            poi.uri = boost::lexical_cast<std::string>(osmid);
            if(tags.find("name") != tags.end()){
                poi.name = tags.at("name");
            }
            pois[osmid] = poi;
        }
    }
}
void Visitor::set_coord_admin(){
    for(auto& adm : OSMAdminRefs ){
        adm.second.coord = admin_centre_coord(adm.second.refs);
    }
}

}}
//void fill_from_osm(GeoRef & geo_ref_to_fill, const std::string & osm_pbf_filename){
int main(int argc, char** argv) {
    navitia::init_app();
    pt::ptime start;
    std::string input, connection_string;
    po::options_description desc("Allowed options");
    desc.add_options()
        ("version,v", "Affiche la version")
        ("help,h", "Affiche l'aide")
        ("input,i", po::value<std::string>(&input)->required(), "Fichier OSM à utiliser")
        ("connection-string", po::value<std::string>(&connection_string)->required(), "parametres de connexion à la base de données: host=localhost user=navitia dbname=navitia password=navitia");

    po::variables_map vm;
    po::store(po::parse_command_line(argc, argv, desc), vm);

    if(vm.count("version")){
        std::cout << argv[0] << " V" << NAVITIA_VERSION << " " << NAVITIA_BUILD_TYPE << std::endl;
        return 0;
    }

    if(vm.count("help")) {
        std::cout << desc <<  "\n";
        return 1;
    }

    start = pt::microsec_clock::local_time();
    po::notify(vm);
    ed::connectors::Visitor v(connection_string);
    v.lotus.start_transaction();

    v.clean_georef();
    v.fill_PoiTypes();
    v.lotus.prepare_bulk_insert("georef.way", {"id", "name", "uri"});
    CanalTP::read_osm_pbf(input, v);
    v.set_coord_admin();
    v.lotus.finish_bulk_insert();

    std::cout << v.nodes.size() << " nodes, " << v.ways.size() << " ways/" << v.total_ways << std::endl;
    std::cout<<v.poi_types.size()<<" poitype/ "<<v.pois.size()<< " poi"<<std::endl;
    v.count_nodes_uses();
    v.insert_edges();

    std::cout<<"Chargement des adresses"<<std::endl;
    v.insert_house_numbers();
    v.insert_poitypes();
    v.insert_pois();
    std::cout<<"Chargement des données administratives"<<std::endl;
    v.insert_admin();

    v.build_relation();

    std::cout<<"Fusion des voies"<<std::endl;
    v.build_ways();

    v.lotus.commit();

    std::cout<<"Durée d'intégration des données OSM :"<<to_simple_string(pt::microsec_clock::local_time() - start)<<std::endl;
    return 0;
}




