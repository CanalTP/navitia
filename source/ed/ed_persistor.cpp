#include "ed_persistor.h"

namespace bg = boost::gregorian;

namespace ed{

void EdPersistor::persist(const ed::Data& data, const navitia::type::MetaData& meta){

    this->lotus.start_transaction();

    std::cout << "début : vider toutes les tables (TRUNCATE)!" << std::endl;
    this->clean_db();

    std::cout << "Begin of block insert" << std::endl;
    std::cout << "Inserting metadata" << std::endl;
    this->insert_metadata(meta);
    std::cout << "Finished to insert metadata" << std::endl;
    std::cout << "Inserting networks" << std::endl;
    this->insert_networks(data.networks);
    std::cout << "Finished to insert networks" << std::endl;
    std::cout << "Inserting commercial_modes" << std::endl;
    this->insert_commercial_modes(data.commercial_modes);
    std::cout << "Finished to insert commercial_modes" << std::endl;
    std::cout << "Inserting physical_modes" << std::endl;
    this->insert_physical_modes(data.physical_modes);
    std::cout << "Finished to insert physical_modes" << std::endl;
    std::cout << "Inserting companies" << std::endl;
    this->insert_companies(data.companies);
    std::cout << "Finished to insert companies" << std::endl;
    std::cout << "Inserting contributors" << std::endl;
    this->insert_contributors(data.contributors);
    std::cout << "Finished to insert contributors" << std::endl;

    std::cout << "Inserting sa_sp_properties" << std::endl;
    this->insert_sa_sp_properties(data);
    std::cout << "Finished to insert sa_sp_properties" << std::endl;
    std::cout << "Inserting stop_areas" << std::endl;
    this->insert_stop_areas(data.stop_areas);
    std::cout << "Finished to insert stop_areas" << std::endl;
    std::cout << "Inserting stop_points" << std::endl;
    this->insert_stop_points(data.stop_points);
    std::cout << "Finished to insert stop_points" << std::endl;

    std::cout << "Inserting lines" << std::endl;
    this->insert_lines(data.lines);
    std::cout << "Finished to insert lines" << std::endl;
    std::cout << "Inserting routes" << std::endl;
    this->insert_routes(data.routes);
    std::cout << "Finished to insert routes" << std::endl;
    std::cout << "Inserting journey_patterns" << std::endl;
    this->insert_journey_patterns(data.journey_patterns);
    std::cout << "Finished to insert journey_patterns" << std::endl;

    std::cout << "Inserting validity_patterns" << std::endl;
    this->insert_validity_patterns(data.validity_patterns);
    std::cout << "Finished to insert validity_patterns" << std::endl;
    std::cout << "Inserting vehicle_properties" << std::endl;
    this->insert_vehicle_properties(data.vehicle_journeys);
    std::cout << "Finished to insert vehicle_properties" << std::endl;
    std::cout << "Inserting vehicle_journeys" << std::endl;
    this->insert_vehicle_journeys(data.vehicle_journeys);
    std::cout << "Finished to insert vehicle_journeys" << std::endl;

    std::cout << "Inserting journey_pattern_point" << std::endl;
    this->insert_journey_pattern_point(data.journey_pattern_points);
    std::cout << "Finished to insert journey_pattern_point" << std::endl;

    std::cout << "Inserting stop_times" << std::endl;
    this->insert_stop_times(data.stops);
    std::cout << "Finished to insert stop_times" << std::endl;

    //@TODO: les connections ont des doublons, en attendant que ce soit corrigé, on ne les enregistre pas
    std::cout << "Inserting stop_point_connections" << std::endl;
    this->insert_stop_point_connections(data.stop_point_connections);
    std::cout << "Finished to insert stop_point_connections" << std::endl;
    std::cout << "Inserting journey_pattern_point_connections" << std::endl;
    this->insert_journey_pattern_point_connections(data.journey_pattern_point_connections);
    std::cout << "Finished to insert journey_pattern_point_connections" << std::endl;
    std::cout << "Inserting aliases" << std::endl;
    this->insert_alias(data.alias);
    std::cout << "Finished to insert aliases" << std::endl;
    std::cout << "Inserting synonyms" << std::endl;
    this->insert_synonyms(data.synonymes);
    std::cout << "Finished to insert synonyms" << std::endl;
    std::cout << "End of block insert" << std::endl;
    this->build_relation();
    std::cout << "Start commit" << std::endl;
    this->lotus.commit();
    std::cout << "End of commit" << std::endl;
}

void EdPersistor::insert_metadata(const navitia::type::MetaData& meta){
    std::string request = "insert into navitia.parameters (beginning_date, end_date) VALUES ('" + bg::to_iso_extended_string(meta.production_date.begin()) +
        "', '" + bg::to_iso_extended_string(meta.production_date.end()) + "');";
    PQclear(this->lotus.exec(request));
}

void EdPersistor::build_relation(){
    PQclear(this->lotus.exec("SELECT georef.match_stop_area_to_admin()", "", PGRES_TUPLES_OK));
    PQclear(this->lotus.exec("SELECT georef.match_stop_point_to_admin();", "", PGRES_TUPLES_OK));
}

void EdPersistor::clean_db(){
    PQclear(this->lotus.exec("TRUNCATE navitia.stop_area, navitia.line, navitia.company, navitia.physical_mode, navitia.contributor, navitia.alias,navitia.synonym,"
                "navitia.commercial_mode, navitia.vehicle_properties, navitia.properties, navitia.validity_pattern, navitia.network, navitia.parameters, navitia.connection CASCADE"));
}

void EdPersistor::insert_networks(const std::vector<types::Network*>& networks){
    this->lotus.prepare_bulk_insert("navitia.network", {"id", "uri", "name", "comment"});
    for(types::Network* net : networks){
        std::vector<std::string> values;
        values.push_back(std::to_string(net->idx));
        values.push_back(net->uri);
        values.push_back(net->name);
        values.push_back(net->comment);
        this->lotus.insert(values);
    }
    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_commercial_modes(const std::vector<types::CommercialMode*>& commercial_modes){
    this->lotus.prepare_bulk_insert("navitia.commercial_mode", {"id", "uri", "name"});
    for(types::CommercialMode* mode : commercial_modes){
        std::vector<std::string> values;
        values.push_back(std::to_string(mode->idx));
        values.push_back(mode->uri);
        values.push_back(mode->name);
        this->lotus.insert(values);
    }
    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_physical_modes(const std::vector<types::PhysicalMode*>& physical_modes){
    this->lotus.prepare_bulk_insert("navitia.physical_mode", {"id", "uri", "name"});
    for(types::PhysicalMode* mode : physical_modes){
        std::vector<std::string> values;
        values.push_back(std::to_string(mode->idx));
        values.push_back(mode->uri);
        values.push_back(mode->name);
        this->lotus.insert(values);
    }
    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_companies(const std::vector<types::Company*>& companies){
    this->lotus.prepare_bulk_insert("navitia.company", {"id", "uri", "name", "comment", "address_name", "address_number",
                                    "address_type_name", "phone_number","mail", "website", "fax"});
    for(types::Company* company : companies){
        std::vector<std::string> values;
        values.push_back(std::to_string(company->idx));
        values.push_back(company->uri);
        values.push_back(company->name);
        values.push_back(company->comment);
        values.push_back(company->address_name);
        values.push_back(company->address_number);
        values.push_back(company->address_type_name);
        values.push_back(company->phone_number);
        values.push_back(company->mail);
        values.push_back(company->website);
        values.push_back(company->fax);
        this->lotus.insert(values);
    }
    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_contributors(const std::vector<types::Contributor*>& contributors){
    this->lotus.prepare_bulk_insert("navitia.contributor", {"id", "uri", "name"});
    for(types::Contributor* contributor : contributors){
        std::vector<std::string> values;
        values.push_back(std::to_string(contributor->idx));
        values.push_back(contributor->uri);
        values.push_back(contributor->name);
        this->lotus.insert(values);
    }
    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_sa_sp_properties(const ed::Data& data){
    this->lotus.prepare_bulk_insert("navitia.properties", {"id", "wheelchair_boarding", "sheltered", "elevator", "escalator",
                                    "bike_accepted","bike_depot", "visual_announcement", "audible_announcement",
                                    "appropriate_escort", "appropriate_signage"});
    std::vector<navitia::type::idx_t> to_insert;
    for(types::StopArea* sa : data.stop_areas){
        navitia::type::idx_t idx = sa->to_ulog();
        if(!binary_search(to_insert.begin(), to_insert.end(), idx)){
            std::vector<std::string> values;
            values.push_back(std::to_string(idx));
            values.push_back(std::to_string(sa->wheelchair_boarding()));
            values.push_back(std::to_string(sa->sheltered()));
            values.push_back(std::to_string(sa->elevator()));
            values.push_back(std::to_string(sa->escalator()));
            values.push_back(std::to_string(sa->bike_accepted()));
            values.push_back(std::to_string(sa->bike_depot()));
            values.push_back(std::to_string(sa->visual_announcement()));
            values.push_back(std::to_string(sa->audible_announcement()));
            values.push_back(std::to_string(sa->appropriate_escort()));
            values.push_back(std::to_string(sa->appropriate_signage()));
            this->lotus.insert(values);
            to_insert.push_back(idx);
            std::sort(to_insert.begin(), to_insert.end());
        }
    }
    for(types::StopPoint* sp : data.stop_points){
        navitia::type::idx_t idx = sp->to_ulog();
        if(!binary_search(to_insert.begin(), to_insert.end(), idx)){
            std::vector<std::string> values;
            values.push_back(std::to_string(idx));
            values.push_back(std::to_string(sp->wheelchair_boarding()));
            values.push_back(std::to_string(sp->sheltered()));
            values.push_back(std::to_string(sp->elevator()));
            values.push_back(std::to_string(sp->escalator()));
            values.push_back(std::to_string(sp->bike_accepted()));
            values.push_back(std::to_string(sp->bike_depot()));
            values.push_back(std::to_string(sp->visual_announcement()));
            values.push_back(std::to_string(sp->audible_announcement()));
            values.push_back(std::to_string(sp->appropriate_escort()));
            values.push_back(std::to_string(sp->appropriate_signage()));
            this->lotus.insert(values);
            to_insert.push_back(idx);
            std::sort(to_insert.begin(), to_insert.end());
        }
    }
    for(types::StopPointConnection* connection : data.stop_point_connections){
        navitia::type::idx_t idx = connection->to_ulog();
        if(!binary_search(to_insert.begin(), to_insert.end(), idx)){
            std::vector<std::string> values;
            values.push_back(std::to_string(idx));
            values.push_back(std::to_string(connection->wheelchair_boarding()));
            values.push_back(std::to_string(connection->sheltered()));
            values.push_back(std::to_string(connection->elevator()));
            values.push_back(std::to_string(connection->escalator()));
            values.push_back(std::to_string(connection->bike_accepted()));
            values.push_back(std::to_string(connection->bike_depot()));
            values.push_back(std::to_string(connection->visual_announcement()));
            values.push_back(std::to_string(connection->audible_announcement()));
            values.push_back(std::to_string(connection->appropriate_escort()));
            values.push_back(std::to_string(connection->appropriate_signage()));
            this->lotus.insert(values);
            to_insert.push_back(idx);
            std::sort(to_insert.begin(), to_insert.end());
        }
    }
    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_stop_areas(const std::vector<types::StopArea*>& stop_areas){
    this->lotus.prepare_bulk_insert("navitia.stop_area", {"id", "uri", "name", "coord", "comment", "properties_id"});

    for(types::StopArea* sa : stop_areas){
        std::vector<std::string> values;
        values.push_back(std::to_string(sa->idx));
        values.push_back(sa->uri);
        values.push_back(sa->name);
        values.push_back("POINT(" + std::to_string(sa->coord.lon()) + " " + std::to_string(sa->coord.lat()) + ")");
        values.push_back(sa->comment);
        values.push_back(std::to_string(sa->to_ulog()));
        this->lotus.insert(values);
    }

    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_stop_points(const std::vector<types::StopPoint*>& stop_points){
    this->lotus.prepare_bulk_insert("navitia.stop_point", {"id", "uri", "name", "coord", "comment", "fare_zone", "stop_area_id","properties_id"});

    for(types::StopPoint* sp : stop_points){
        std::vector<std::string> values;
        values.push_back(std::to_string(sp->idx));
        values.push_back(sp->uri);
        values.push_back(sp->name);
        values.push_back("POINT(" + std::to_string(sp->coord.lon()) + " " + std::to_string(sp->coord.lat()) + ")");
        values.push_back(sp->comment);
        values.push_back(std::to_string(sp->fare_zone));
        if(sp->stop_area != NULL){
            values.push_back(std::to_string(sp->stop_area->idx));
        }else{
            values.push_back(lotus.null_value);
        }
        values.push_back(std::to_string(sp->to_ulog()));
        this->lotus.insert(values);
    }

    this->lotus.finish_bulk_insert();

}
void EdPersistor::insert_lines(const std::vector<types::Line*>& lines){
    this->lotus.prepare_bulk_insert("navitia.line", {"id", "uri", "name", "comment", "color", "code", "commercial_mode_id", "network_id"});

    for(types::Line* line : lines){
        std::vector<std::string> values;
        values.push_back(std::to_string(line->idx));
        values.push_back(line->uri);
        values.push_back(line->name);
        values.push_back(line->comment);
        values.push_back(line->color);
        values.push_back(line->code);
        if(line->commercial_mode != NULL){
            values.push_back(std::to_string(line->commercial_mode->idx));
        }else{
            values.push_back(lotus.null_value);
        }

        if(line->network != NULL){
            values.push_back(std::to_string(line->network->idx));
        }else{
            values.push_back(lotus.null_value);
        }
        this->lotus.insert(values);
    }

    this->lotus.finish_bulk_insert();

}

void EdPersistor::insert_stop_point_connections(const std::vector<types::StopPointConnection*>& connections){
    this->lotus.prepare_bulk_insert("navitia.connection", {"departure_stop_point_id", "destination_stop_point_id", "connection_type_id",
                                    "display_duration","duration", "max_duration", "properties_id"});

    //@TODO properties!!
    for(types::StopPointConnection* co : connections){
        std::vector<std::string> values;
        values.push_back(std::to_string(co->departure->idx));
        values.push_back(std::to_string(co->destination->idx));
        values.push_back(std::to_string(static_cast<int>(co->connection_kind)));
        // la durée de la correspondance à afficher
        values.push_back(std::to_string(co->display_duration));
        // la durée réelle de la correspondance
        values.push_back(std::to_string(co->duration));
        values.push_back(std::to_string(co->max_duration));
        values.push_back(std::to_string(co->to_ulog()));
        this->lotus.insert(values);
    }
    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_journey_pattern_point_connections(const std::vector<types::JourneyPatternPointConnection*>& connections){
    this->lotus.prepare_bulk_insert("navitia.journey_pattern_point_connection", {"departure_journey_pattern_point_id",
            "destination_journey_pattern_point_id", "connection_kind_id", "length"});

    //@TODO properties!!
    for(types::JourneyPatternPointConnection* co : connections){
        std::vector<std::string> values;
        values.push_back(std::to_string(co->departure->idx));
        values.push_back(std::to_string(co->destination->idx));
        values.push_back(std::to_string(static_cast<int>(co->connection_kind)));
        values.push_back(std::to_string(co->length));
        this->lotus.insert(values);
    }

    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_routes(const std::vector<types::Route*>& routes){
    this->lotus.prepare_bulk_insert("navitia.route", {"id", "uri", "name", "comment", "line_id"});

    for(types::Route* route : routes){
        std::vector<std::string> values;
        values.push_back(std::to_string(route->idx));
        values.push_back(route->uri);
        values.push_back(route->name);
        values.push_back(route->comment);
        if(route->line != NULL){
            values.push_back(std::to_string(route->line->idx));
        }else{
            values.push_back(lotus.null_value);
        }
        this->lotus.insert(values);
    }

    this->lotus.finish_bulk_insert();

}

void EdPersistor::insert_journey_patterns(const std::vector<types::JourneyPattern*>& journey_patterns){
    this->lotus.prepare_bulk_insert("navitia.journey_pattern", {"id", "uri", "name", "comment", "physical_mode_id", "is_frequence", "route_id"});

    for(types::JourneyPattern* jp : journey_patterns){
        std::vector<std::string> values;
        values.push_back(std::to_string(jp->idx));
        values.push_back(jp->uri);
        values.push_back(jp->name);
        values.push_back(jp->comment);
        if (jp->physical_mode != NULL){
            values.push_back(std::to_string(jp->physical_mode->idx));
        }else{
            values.push_back(lotus.null_value);
        }
        values.push_back(std::to_string(jp->is_frequence));
        if(jp->route != NULL){
            values.push_back(std::to_string(jp->route->idx));
        }else{
            values.push_back(lotus.null_value);
        }
        this->lotus.insert(values);
    }

    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_validity_patterns(const std::vector<types::ValidityPattern*>& validity_patterns){
    this->lotus.prepare_bulk_insert("navitia.validity_pattern", {"id", "days"});

    for(types::ValidityPattern* vp : validity_patterns){
        std::vector<std::string> values;
        values.push_back(std::to_string(vp->idx));
        values.push_back(vp->days.to_string());
        this->lotus.insert(values);
    }

    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_stop_times(const std::vector<types::StopTime*>& stop_times){
    this->lotus.prepare_bulk_insert("navitia.stop_time", {"arrival_time", "departure_time", "local_traffic_zone", "start_time",
                                    "end_time", "headway_sec", "odt", "pick_up_allowed", "drop_off_allowed",
                                    "is_frequency", "journey_pattern_point_id", "vehicle_journey_id", "comment", "date_time_estimated"});

    for(types::StopTime* stop : stop_times){
        std::vector<std::string> values;
        values.push_back(std::to_string(stop->arrival_time));
        values.push_back(std::to_string(stop->departure_time));
        if(stop->local_traffic_zone != navitia::type::invalid_idx){
            values.push_back(std::to_string(stop->local_traffic_zone));
        }else{
            values.push_back(lotus.null_value);
        }
        values.push_back(std::to_string(stop->start_time));
        values.push_back(std::to_string(stop->end_time));
        values.push_back(std::to_string(stop->headway_secs));
        values.push_back(std::to_string(stop->ODT));
        values.push_back(std::to_string(stop->pick_up_allowed));
        values.push_back(std::to_string(stop->drop_off_allowed));
        values.push_back(std::to_string(stop->is_frequency));

        if(stop->journey_pattern_point != NULL){
            values.push_back(std::to_string(stop->journey_pattern_point->idx));
        }else{
            values.push_back(lotus.null_value);
        }
        if(stop->vehicle_journey != NULL){
            values.push_back(std::to_string(stop->vehicle_journey->idx));
        }else{
            values.push_back(lotus.null_value);
        }
        values.push_back(stop->comment);
        values.push_back(std::to_string(stop->date_time_estimated));
        this->lotus.insert(values);
    }

    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_journey_pattern_point(const std::vector<types::JourneyPatternPoint*>& journey_pattern_points){
    this->lotus.prepare_bulk_insert("navitia.journey_pattern_point", {"id", "uri", "name", "comment", "\"order\"", "stop_point_id", "journey_pattern_id"});

    for(types::JourneyPatternPoint* jpp : journey_pattern_points){
        std::vector<std::string> values;
        values.push_back(std::to_string(jpp->idx));
        values.push_back(jpp->uri);
        values.push_back(jpp->name);
        values.push_back(jpp->comment);
        values.push_back(std::to_string(jpp->order));

        if(jpp->stop_point != NULL){
            values.push_back(std::to_string(jpp->stop_point->idx));
        }else{
            values.push_back(lotus.null_value);
        }

        if(jpp->journey_pattern != NULL){
            values.push_back(std::to_string(jpp->journey_pattern->idx));
        }else{
            values.push_back(lotus.null_value);
        }
        this->lotus.insert(values);
    }

    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_vehicle_properties(const std::vector<types::VehicleJourney*>& vehicle_journeys){
    this->lotus.prepare_bulk_insert("navitia.vehicle_properties", {"id", "wheelchair_accessible",
                                    "bike_accepted", "air_conditioned", "visual_announcement",
                                    "audible_announcement", "appropriate_escort", "appropriate_signage",
                                    "school_vehicle"});

    std::vector<navitia::type::idx_t> to_insert;
    for(types::VehicleJourney* vj : vehicle_journeys){

        navitia::type::idx_t idx = vj->to_ulog();
        if(!binary_search(to_insert.begin(), to_insert.end(), idx)){
            std::vector<std::string> values;
            values.push_back(std::to_string(idx));
            values.push_back(std::to_string(vj->wheelchair_accessible()));
            values.push_back(std::to_string(vj->bike_accepted()));
            values.push_back(std::to_string(vj->air_conditioned()));
            values.push_back(std::to_string(vj->visual_announcement()));
            values.push_back(std::to_string(vj->audible_announcement()));
            values.push_back(std::to_string(vj->appropriate_escort()));
            values.push_back(std::to_string(vj->appropriate_signage()));
            values.push_back(std::to_string(vj->school_vehicle()));
            this->lotus.insert(values);
            to_insert.push_back(idx);
            std::sort(to_insert.begin(), to_insert.end());
        }
    }
    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_vehicle_journeys(const std::vector<types::VehicleJourney*>& vehicle_journeys){
    this->lotus.prepare_bulk_insert("navitia.vehicle_journey", {"id", "uri", "name", "comment", "validity_pattern_id",
                                    "adapted_validity_pattern_id", "company_id", "journey_pattern_id", "theoric_vehicle_journey_id",
                                    "vehicle_properties_id","odt_type_id", "odt_message"});

    for(types::VehicleJourney* vj : vehicle_journeys){
        std::vector<std::string> values;
        values.push_back(std::to_string(vj->idx));
        values.push_back(vj->uri);
        values.push_back(vj->name);
        values.push_back(vj->comment);
        if(vj->validity_pattern != NULL){
            values.push_back(std::to_string(vj->validity_pattern->idx));
        }else{
            values.push_back(lotus.null_value);
        }
        if(vj->adapted_validity_pattern != NULL){
            values.push_back(std::to_string(vj->adapted_validity_pattern->idx));
        }else{
            values.push_back(std::to_string(vj->validity_pattern->idx));
        }
        if(vj->company != NULL){
            values.push_back(std::to_string(vj->company->idx));
        }else{
            values.push_back(lotus.null_value);
        }
        if(vj->journey_pattern != NULL){
            values.push_back(std::to_string(vj->journey_pattern->idx));
        }else{
            values.push_back(lotus.null_value);
        }
        if(vj->theoric_vehicle_journey != NULL){
            values.push_back(std::to_string(vj->theoric_vehicle_journey->idx));
        }else{
            //@TODO WTF??
            values.push_back(lotus.null_value);
        }
        values.push_back(std::to_string(vj->to_ulog()));
        values.push_back(std::to_string(static_cast<int>(vj->vehicle_journey_type)));
        values.push_back(vj->odt_message);
        this->lotus.insert(values);
    }

    this->lotus.finish_bulk_insert();
}

void EdPersistor::insert_alias(const std::map<std::string, std::string>& alias){
    this->lotus.prepare_bulk_insert("navitia.alias", {"id", "key", "value"});
    int count=1;
    std::map <std::string, std::string> ::const_iterator it = alias.begin();
    while(it != alias.end()){
        std::vector<std::string> values;
        values.push_back(std::to_string(count));
        values.push_back(it->first);
        values.push_back(it->second);
        this->lotus.insert(values);
        count++;
        ++it;
    }
    this->lotus.finish_bulk_insert();

}

void EdPersistor::insert_synonyms(const std::map<std::string, std::string>& synonyms){
    this->lotus.prepare_bulk_insert("navitia.synonym", {"id", "key", "value"});
    int count = 1;
        std::map <std::string, std::string>::const_iterator it = synonyms.begin();
    while(it != synonyms.end()){
        std::vector<std::string> values;
        values.push_back(std::to_string(count));
        values.push_back(it->first);
        values.push_back(it->second);
        this->lotus.insert(values);
        count++;
        ++it;
    }
    this->lotus.finish_bulk_insert();
}

}//namespace
