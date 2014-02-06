#include "dataraptor.h"
#include "routing.h"
#include "routing/raptor_utils.h"

namespace navitia { namespace routing {

void dataRAPTOR::load(const type::PT_Data &data)
{
    Label label;
    label.dt = DateTimeUtils::inf;
    label.boarding = nullptr;
    label.type = boarding_type::uninitialized;
    labels_const.assign(data.journey_pattern_points.size(), label);
    label.dt = DateTimeUtils::min;
    labels_const_reverse.assign(data.journey_pattern_points.size(), label);
    
    foot_path_forward.clear();
    foot_path_backward.clear();
    footpath_index_backward.clear();
    footpath_index_forward.clear();
    footpath_rp_backward.clear();
    footpath_rp_forward.clear();
    std::vector<std::map<navitia::type::idx_t, const navitia::type::StopPointConnection*> > footpath_temp_forward, footpath_temp_backward;
    footpath_temp_forward.resize(data.stop_points.size());
    footpath_temp_backward.resize(data.stop_points.size());

    //Construction des connexions entre journey_patternpoints
    //(sert pour les prolongements de service ainsi que les correpondances garanties
    for(const type::JourneyPatternPointConnection* jppc : data.journey_pattern_point_connections) {
        footpath_rp_forward.insert(std::make_pair(jppc->departure->idx, jppc));
        footpath_rp_backward.insert(std::make_pair(jppc->destination->idx, jppc));
    }

    //Construction de la liste des marche à pied à partir des connexions renseignées
    for(const type::StopPointConnection* connection : data.stop_point_connections) {
        footpath_temp_forward[connection->departure->idx][connection->destination->idx] = connection;
        footpath_temp_backward[connection->departure->idx][connection->destination->idx] = connection;
    }


    //On rajoute des connexions entre les stops points d'un même stop area si elles n'existent pas
    footpath_index_forward.resize(data.stop_points.size());
    footpath_index_backward.resize(data.stop_points.size());
    for(const type::StopPoint* sp : data.stop_points) {
        footpath_index_forward[sp->idx].first = foot_path_forward.size();
        footpath_index_backward[sp->idx].first = foot_path_backward.size();
        int size_forward = 0, size_backward = 0;
        for(auto conn : footpath_temp_forward[sp->idx]) {
            foot_path_forward.push_back(conn.second);
            ++size_forward;
        }
        for(auto conn : footpath_temp_backward[sp->idx]) {
            foot_path_backward.push_back(conn.second);
            ++size_backward;
        }

        footpath_index_forward[sp->idx].second = size_forward;
        footpath_index_backward[sp->idx].second = size_backward;
    }

    typedef std::unordered_map<navitia::type::idx_t, vector_idx> idx_vector_idx;
    idx_vector_idx ridx_journey_pattern;
    
    arrival_times.clear();
    departure_times.clear();
    st_idx_forward.clear(); // Nom a changer ce ne sont plus des idx mais des pointeurs
    st_idx_backward.clear(); //
    first_stop_time.clear();

    for(int i=0; i<=365; ++i) {
        jp_validity_patterns.push_back(boost::dynamic_bitset<>(data.journey_patterns.size()));
    }

    for(const type::JourneyPattern* journey_pattern : data.journey_patterns) {
        first_stop_time.push_back(arrival_times.size());
        nb_trips.push_back(journey_pattern->vehicle_journey_list.size());

        // On regroupe ensemble tous les horaires de tous les journey_pattern_point
        for(unsigned int i=0; i < journey_pattern->journey_pattern_point_list.size(); ++i) {
            std::vector<type::StopTime*> vec_st;
            for(const type::VehicleJourney* vj : journey_pattern->vehicle_journey_list) {
                vec_st.push_back(vj->stop_time_list[i]);
            }
            std::sort(vec_st.begin(), vec_st.end(),
                      [&](type::StopTime* st1, type::StopTime* st2)->bool{
                        uint32_t time1, time2;
                        if(!st1->is_frequency())
                            time1 = DateTimeUtils::hour(st1->departure_time);
                        else
                            time1 = DateTimeUtils::hour(st1->end_time);
                        if(!st2->is_frequency())
                            time2 = DateTimeUtils::hour(st2->departure_time);
                        else
                            time2 = DateTimeUtils::hour(st2->end_time);
                        if(time1 == time2) {
                            auto st1_first = st1->vehicle_journey->stop_time_list.front();
                            auto st2_first = st2->vehicle_journey->stop_time_list.front();
                            if(st1_first->departure_time == st2_first->departure_time) {
                                return st1_first->vehicle_journey->idx < st2_first->vehicle_journey->idx;
                            }
                            return st1_first->departure_time < st2_first->departure_time;
                        }
                        return time1 < time2;});

            st_idx_forward.insert(st_idx_forward.end(), vec_st.begin(), vec_st.end());

            for(auto st : vec_st) {
                uint32_t time;
                if(!st->is_frequency())
                    time = DateTimeUtils::hour(st->departure_time);
                else
                    time = DateTimeUtils::hour(st->end_time);
                departure_times.push_back(time);
            }

            std::sort(vec_st.begin(), vec_st.end(),
                  [&](type::StopTime* st1, type::StopTime* st2)->bool{
                      uint32_t time1, time2;
                      if(!st1->is_frequency())
                          time1 = DateTimeUtils::hour(st1->arrival_time);
                      else
                          time1 = DateTimeUtils::hour(st1->start_time);
                      if(!st2->is_frequency())
                          time2 = DateTimeUtils::hour(st2->arrival_time);
                      else
                          time2 = DateTimeUtils::hour(st2->start_time);
                      if(time1 == time2) {
                          auto st1_first = st1->vehicle_journey->stop_time_list.front();
                          auto st2_first = st2->vehicle_journey->stop_time_list.front();
                          if(st1_first->arrival_time == st2_first->arrival_time) {
                              return st1_first->vehicle_journey->idx > st2_first->vehicle_journey->idx;
                          }
                          return st1_first->arrival_time > st2_first->arrival_time;
                      }
                      return time1 > time2;});

            st_idx_backward.insert(st_idx_backward.end(), vec_st.begin(), vec_st.end());
            for(auto st : vec_st) {
                uint32_t time;
                if(!st->is_frequency())
                    time = DateTimeUtils::hour(st->arrival_time);
                else
                    time = DateTimeUtils::hour(st->start_time);
                arrival_times.push_back(time);
            }
        }

        // On dit que le journey pattern est valide en date j s'il y a au moins une circulation à j-1/j+1
        for(int i=0; i<=365; ++i) {
            for(auto vj : journey_pattern->vehicle_journey_list) {
                if(vj->validity_pattern->check2(i)) {
                    jp_validity_patterns[i].set(journey_pattern->idx);
                    break;
                }
            }
        }
    }


}

}}
