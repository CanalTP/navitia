/* Copyright © 2001-2014, Canal TP and/or its affiliates. All rights reserved.

This file is part of Navitia,
    the software to build cool stuff with public transport.

Hope you'll enjoy and contribute to this project,
    powered by Canal TP (www.canaltp.fr).
Help us simplify mobility and open public transport:
    a non ending quest to the responsive locomotion way of traveling!

LICENCE: This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.

Stay tuned using
twitter @navitia
channel `#navitia` on riot https://riot.im/app/#/room/#navitia:matrix.org
https://groups.google.com/d/forum/navitia
www.navitia.io
*/

#include "departure_boards.h"

#include "request_handle.h"
#include "routing/dataraptor.h"
#include "routing/dataraptor.h"
#include "routing/get_stop_times.h"
#include "type/pb_converter.h"
#include "utils/functions.h"
#include "utils/paginate.h"

#include <boost/container/flat_set.hpp>
#include <boost/date_time/posix_time/posix_time.hpp>
#include <boost/lexical_cast.hpp>

#include <utility>

namespace pt = boost::posix_time;

namespace navitia {
namespace timetables {

using RoutePointIdx = std::pair<routing::RouteIdx, routing::SpIdx>;

static bool is_last_stoptime(const nt::StopTime* stop_time) {
    return stop_time->vehicle_journey && !stop_time->vehicle_journey->stop_time_list.empty()
           && stop_time->vehicle_journey->stop_time_list.back().order() == stop_time->order();
}

static bool is_terminus_for_all_stop_times(const std::vector<routing::datetime_stop_time>& stop_times) {
    for (const auto& st : stop_times) {
        if (!is_last_stoptime(st.second)) {
            return false;
        }
    }
    return !stop_times.empty();
}

static void render(PbCreator& pb_creator,
                   const std::map<RoutePointIdx, pbnavitia::ResponseStatus>& response_status,
                   const std::map<RoutePointIdx, vector_dt_st>& map_route_stop_point,
                   const std::map<RoutePointIdx, first_and_last_stop_time>& map_route_point_first_last_st,
                   const DateTime datetime,
                   const DateTime max_datetime,
                   const boost::optional<const std::string>& calendar_id,
                   const uint32_t depth) {
    pb_creator.action_period =
        pt::time_period(to_posix_time(datetime, *pb_creator.data), to_posix_time(max_datetime, *pb_creator.data));

    for (auto id_vec : map_route_stop_point) {
        auto schedule = pb_creator.add_stop_schedules();
        // Each schedule has a stop_point and a route
        const auto* stop_point = pb_creator.data->pt_data->stop_points[id_vec.first.second.val];
        const auto* route = pb_creator.data->pt_data->routes[id_vec.first.first.val];
        pb_creator.fill(stop_point, schedule->mutable_stop_point(), depth);

        auto m_route = schedule->mutable_route();

        pb_creator.fill(route, m_route, depth);
        if (route->line != nullptr) {
            auto m_line = m_route->mutable_line();
            pb_creator.fill(route->line, m_line, 0);
        }
        auto pt_display_information = schedule->mutable_pt_display_informations();

        pb_creator.fill(route, pt_display_information, 0);

        // Now we fill the date_times
        for (auto dt_st : id_vec.second) {
            const auto& st_calendar = navitia::StopTimeCalendar(dt_st.second, dt_st.first, calendar_id);
            // terminus or partial terminus
            if (is_last_stoptime(st_calendar.stop_time)) {
                continue;
            }
            auto date_time = schedule->add_date_times();
            pb_creator.fill(&st_calendar, date_time, 0);
            if (dt_st.second != nullptr) {
                auto vj = dt_st.second->vehicle_journey;
                if (vj != nullptr) {
                    for (const auto& comment : pb_creator.data->pt_data->comments.get(*vj)) {
                        pb_creator.fill(&comment, date_time->mutable_properties()->add_notes(), 0);
                    }
                }
            }
        }

        // add first and last datetime
        const auto& first_last_it = map_route_point_first_last_st.find(id_vec.first);
        if (first_last_it != map_route_point_first_last_st.end()) {
            // first date time
            if (first_last_it->second.first) {
                auto first_stop_time = *(first_last_it->second.first);
                const auto& st_calendar =
                    navitia::StopTimeCalendar(first_stop_time.second, first_stop_time.first, calendar_id);
                pb_creator.fill(&st_calendar, schedule->mutable_first_datetime(), 0);
            }
            // last date time
            if (first_last_it->second.second) {
                auto last_stop_time = *(first_last_it->second.second);
                const auto& st_calendar =
                    navitia::StopTimeCalendar(last_stop_time.second, last_stop_time.first, calendar_id);
                pb_creator.fill(&st_calendar, schedule->mutable_last_datetime(), 0);
            }
        }

        // response status
        const auto& it = response_status.find(id_vec.first);
        if (it != response_status.end()) {
            schedule->set_response_status(it->second);
        }
    }
}

static void render(PbCreator& pb_creator,
                   const std::map<routing::JppIdx, pbnavitia::ResponseStatus>& response_status,
                   const std::map<routing::JppIdx, vector_dt_st>& map_route_stop_point,
                   const std::map<routing::JppIdx, first_and_last_stop_time>& map_route_point_first_last_st,
                   const DateTime datetime,
                   const DateTime max_datetime,
                   const boost::optional<const std::string> calendar_id,
                   const uint32_t depth) {
    pb_creator.action_period =
        pt::time_period(to_posix_time(datetime, *pb_creator.data), to_posix_time(max_datetime, *pb_creator.data));

    for (const auto& id_vec : map_route_stop_point) {
        auto schedule = pb_creator.add_terminus_schedules();
        // Each schedule has a stop_point and a route
        const auto& jpp_dir = pb_creator.data->dataRaptor->jp_container.get(id_vec.first);
        const auto& jp_dir = pb_creator.data->dataRaptor->jp_container.get(jpp_dir.jp_idx);
        const type::Route* route = pb_creator.data->pt_data->routes[jp_dir.route_idx.val];
        const type::StopPoint* stop_point = pb_creator.data->pt_data->stop_points[jpp_dir.sp_idx.val];
        pb_creator.fill(stop_point, schedule->mutable_stop_point(), depth);

        auto m_route = schedule->mutable_route();

        pb_creator.fill(route, m_route, depth);
        if (route->line != nullptr) {
            auto m_line = m_route->mutable_line();
            pb_creator.fill(route->line, m_line, 0);
        }
        auto pt_display_information = schedule->mutable_pt_display_informations();

        pb_creator.fill(route, pt_display_information, 0);

        // add informations for debug. TODO : clean that
        const auto& jpc = pb_creator.data->dataRaptor->jp_container;
        pt_display_information->set_direction(
            pb_creator.data->pt_data->stop_points[jpc.get(jp_dir.jpps.back()).sp_idx.val]->stop_area->name);
        pt_display_information->set_description(std::string("JP = ") + std::to_string(jpp_dir.jp_idx.val)
                                                + " JPP = " + std::to_string(id_vec.first.val));

        // Now we fill the date_times
        for (auto dt_st : id_vec.second) {
            const auto& st_calendar = navitia::StopTimeCalendar(dt_st.second, dt_st.first, calendar_id);
            // terminus or partial terminus
            if (is_last_stoptime(st_calendar.stop_time)) {
                continue;
            }
            auto date_time = schedule->add_date_times();
            pb_creator.fill(&st_calendar, date_time, 0);
            if (dt_st.second != nullptr) {
                auto vj = dt_st.second->vehicle_journey;
                if (vj != nullptr) {
                    for (const auto& comment : pb_creator.data->pt_data->comments.get(*vj)) {
                        pb_creator.fill(&comment, date_time->mutable_properties()->add_notes(), 0);
                    }
                }
            }
        }

        // add first and last datetime
        const auto& first_last_it = map_route_point_first_last_st.find(id_vec.first);
        if (first_last_it != map_route_point_first_last_st.end()) {
            // first date time
            if (first_last_it->second.first) {
                auto first_stop_time = *(first_last_it->second.first);
                const auto& st_calendar =
                    navitia::StopTimeCalendar(first_stop_time.second, first_stop_time.first, calendar_id);
                pb_creator.fill(&st_calendar, schedule->mutable_first_datetime(), 0);
            }
            // last date time
            if (first_last_it->second.second) {
                auto last_stop_time = *(first_last_it->second.second);
                const auto& st_calendar =
                    navitia::StopTimeCalendar(last_stop_time.second, last_stop_time.first, calendar_id);
                pb_creator.fill(&st_calendar, schedule->mutable_last_datetime(), 0);
            }
        }

        // response status
        const auto& it = response_status.find(id_vec.first);
        if (it != response_status.end()) {
            schedule->set_response_status(it->second);
        }
    }
}

static time_duration to_navitia(const boost::posix_time::time_duration& dur) {
    return navitia::seconds(dur.total_seconds());
}

time_duration length_of_time(const time_duration& duration_1, const time_duration& duration_2) {
    if (duration_1 <= duration_2) {
        return duration_2 - duration_1;
    }
    return duration_2 + (hours(24) - duration_1);
}

bool between_opening_and_closing(const time_duration& me, const time_duration& opening, const time_duration& closing) {
    if (opening < closing) {
        return (opening <= me && me <= closing);
    }
    return (opening <= me || me <= closing);
}

bool line_closed(const time_duration& duration,
                 const time_duration& opening,
                 const time_duration& closing,
                 const pt::ptime& date) {
    const auto begin = to_navitia(date.time_of_day());
    return !between_opening_and_closing(begin, opening, closing)
           && !between_opening_and_closing((begin + duration), opening, closing)
           && duration < (length_of_time(opening, closing) + length_of_time(begin, opening));
}

static bool line_closed(const time_duration& duration, const type::Route* route, const pt::ptime& date) {
    if (route->line->opening_time && route->line->closing_time) {
        const auto opening = to_navitia(*route->line->opening_time);
        const auto closing = to_navitia(*route->line->closing_time);
        return line_closed(duration, opening, closing, date);
    }
    return false;
}

static std::vector<routing::JppIdx> get_jpp_from_route_point(const RoutePointIdx& route_point,
                                                             const navitia::routing::dataRAPTOR& data_raptor) {
    const auto& jpps = data_raptor.jpps_from_sp[route_point.second];
    std::vector<routing::JppIdx> routepoint_jpps;
    for (const auto& jpp_from_sp : jpps) {
        const routing::JppIdx& jpp_idx = jpp_from_sp.idx;
        const auto& jpp = data_raptor.jp_container.get(jpp_idx);
        const auto& jp = data_raptor.jp_container.get(jpp.jp_idx);
        if (jp.route_idx != route_point.first) {
            continue;
        }

        routepoint_jpps.push_back(jpp_idx);
    }
    return routepoint_jpps;
}

// JppIdx represents here the final part of a Journey Pattern (from JPP to the end), blind from what's before JPP.
struct JourneyPatternEndsByDirection {
    JourneyPatternEndsByDirection(const routing::JppIdx& direction) : direction(direction), jp_ends() {}
    // direction is the "richest" JP's final part (the one with the most JPP after given JPP)
    routing::JppIdx direction;
    // jp_ends groups JP omnibus and direct JP if they use the same succession of SP in the same order
    std::vector<routing::JppIdx> jp_ends;
};

// For the JP of 'tested', check if all the JPP following 'tested' itself are included in the same order
// in the JP 'direction', starting from  JPP 'direction' itself
static bool is_jp_end_included_in_direction(const routing::JourneyPatternPoint& tested,
                                            const routing::JourneyPatternPoint& direction,
                                            const routing::JourneyPatternContainer& jpc) {
    const auto& jp_tested = jpc.get(tested.jp_idx);
    uint16_t tested_it = tested.order.val;

    const auto& jp_direction = jpc.get(direction.jp_idx);
    for (uint16_t direction_it = direction.order.val; direction_it < jp_direction.jpps.size(); ++direction_it) {
        const auto& jpp_tested = jpc.get(jp_tested.jpps[tested_it]);
        const auto& jpp_direction = jpc.get(jp_direction.jpps[direction_it]);
        if (jpp_tested.sp_idx == jpp_direction.sp_idx) {
            ++tested_it;
            if (tested_it >= jp_tested.jpps.size()) {
                return true;
            }
        }
    }
    return false;
}

void departure_board(PbCreator& pb_creator,
                     const std::string& request,
                     const boost::optional<const std::string>& calendar_id,
                     const std::vector<std::string>& forbidden_uris,
                     const pt::ptime date,
                     const uint32_t duration,
                     const uint32_t depth,
                     const int count,
                     const int start_page,
                     const type::RTLevel rt_level,
                     const size_t items_per_route_point) {
    RequestHandle handler(pb_creator, date, duration, calendar_id);
    handler.init_jpp(request, forbidden_uris);

    if (pb_creator.has_error() || (handler.journey_pattern_points.empty())) {
        return;
    }

    if (calendar_id) {
        // check whether that calendar exists, to raise an early error
        if (pb_creator.data->pt_data->calendars_map.find(*calendar_id)
            == pb_creator.data->pt_data->calendars_map.end()) {
            pb_creator.fill_pb_error(pbnavitia::Error::bad_filter, "stop_schedules : calendar does not exist");
            return;
        }
    }
    //  <stop_point_route, status>
    std::map<RoutePointIdx, pbnavitia::ResponseStatus> response_status;

    std::map<RoutePointIdx, vector_dt_st> map_route_stop_point;
    std::map<RoutePointIdx, first_and_last_stop_time> map_route_point_first_last_st;

    // Mapping route/stop_point
    boost::container::flat_set<RoutePointIdx> route_points;
    for (auto jpp_idx : handler.journey_pattern_points) {
        const auto& jpp = pb_creator.data->dataRaptor->jp_container.get(jpp_idx);
        const auto& jp = pb_creator.data->dataRaptor->jp_container.get(jpp.jp_idx);
        RoutePointIdx key = {jp.route_idx, jpp.sp_idx};
        route_points.insert(key);
    }
    size_t total_result = route_points.size();
    route_points = paginate(route_points, count, start_page);
    auto sort_predicate = [](routing::datetime_stop_time dt1, routing::datetime_stop_time dt2) {
        return dt1.first < dt2.first;
    };
    // we group the stoptime belonging to the same pair (stop_point, route)
    // since we want to display the departures grouped by route
    // the route being a loose commercial direction
    for (const auto& route_point : route_points) {
        const type::StopPoint* stop_point = pb_creator.data->pt_data->stop_points[route_point.second.val];
        const type::Route* route = pb_creator.data->pt_data->routes[route_point.first.val];

        const auto routepoint_jpps = get_jpp_from_route_point(route_point, *pb_creator.data->dataRaptor);

        std::vector<routing::datetime_stop_time> stop_times;
        int32_t utc_offset = 0;
        if (!calendar_id) {
            stop_times =
                routing::get_stop_times(routing::StopEvent::pick_up, routepoint_jpps, handler.date_time,
                                        handler.max_datetime, items_per_route_point, *pb_creator.data, rt_level);
            std::sort(stop_times.begin(), stop_times.end(), sort_predicate);

            if (route->line->opening_time && !stop_times.empty()) {
                // retrieve utc offset
                utc_offset = stop_times[0].second->vehicle_journey->utc_to_local_offset();

                // first and last Date time
                map_route_point_first_last_st[route_point] = get_first_and_last_stop_time(
                    stop_times[0], *route->line->opening_time, routepoint_jpps,
                    handler.date_time + DateTimeUtils::SECONDS_PER_DAY, *pb_creator.data, rt_level, utc_offset);
            }

        } else {
            stop_times = routing::get_calendar_stop_times(routepoint_jpps, DateTimeUtils::hour(handler.date_time),
                                                          DateTimeUtils::hour(handler.max_datetime), *pb_creator.data,
                                                          *calendar_id);
            // for calendar we want the first stop time to start from handler.date_time
            std::sort(stop_times.begin(), stop_times.end(), routing::CalendarScheduleSort(handler.date_time));
            if (stop_times.size() > items_per_route_point) {
                stop_times.resize(items_per_route_point);
            }
        }

        // If we have a calendar_id we have stop_times at the terminus and can use them to check
        // if the current stop is a terminus or a partial terminus
        if (calendar_id) {
            // If all stop_times are on the terminus of their vj
            // (stop_time order is equal to the order of the last stop_time of the vj)
            if (is_terminus_for_all_stop_times(stop_times)) {
                if (stop_point->stop_area == route->destination) {
                    response_status[route_point] = pbnavitia::ResponseStatus::terminus;
                } else {
                    // Otherwise it's a partial_terminus
                    response_status[route_point] = pbnavitia::ResponseStatus::partial_terminus;
                }
            }
        }

        // If there is no departure for a request with "RealTime", Test existance of any departure with "base_schedule"
        // If departure with base_schedule is not empty, additional_information = active_disruption
        // Else additional_information = no_departure_this_day
        if (stop_times.empty() && (response_status.find(route_point) == response_status.end())) {
            auto resp_status = pbnavitia::ResponseStatus::no_departure_this_day;
            if (line_closed(navitia::seconds(duration), route, date)) {
                resp_status = pbnavitia::ResponseStatus::no_active_circulation_this_day;
            }
            if (rt_level != navitia::type::RTLevel::Base) {
                auto tmp_stop_times =
                    routing::get_stop_times(routing::StopEvent::pick_up, routepoint_jpps, handler.date_time,
                                            handler.max_datetime, 1, *pb_creator.data, navitia::type::RTLevel::Base);
                if (!tmp_stop_times.empty()) {
                    resp_status = pbnavitia::ResponseStatus::active_disruption;
                }
            }

            // If we have no calendar terminuses have no pick_up stop_time, we try to get drop_off time
            // to see if it's just a terminus
            if (!calendar_id) {
                auto tmp_stop_times =
                    routing::get_stop_times(routing::StopEvent::drop_off, routepoint_jpps, handler.date_time,
                                            handler.max_datetime, items_per_route_point, *pb_creator.data, rt_level);
                // If there is stop_times and everyone of them is a terminus
                if (!tmp_stop_times.empty() && is_terminus_for_all_stop_times(tmp_stop_times)) {
                    // If we are on the main destination
                    if (stop_point->stop_area == route->destination) {
                        resp_status = pbnavitia::ResponseStatus::terminus;
                    } else {
                        // Otherwise it's a partial_terminus
                        resp_status = pbnavitia::ResponseStatus::partial_terminus;
                    }
                }
            }
            response_status[route_point] = resp_status;
        }

        map_route_stop_point[route_point] = stop_times;
    }

    render(pb_creator, response_status, map_route_stop_point, map_route_point_first_last_st, handler.date_time,
           handler.max_datetime, calendar_id, depth);

    pb_creator.make_paginate(total_result, start_page, count,
                             std::max(pb_creator.departure_boards_size(), pb_creator.stop_schedules_size()));
}

void terminus_schedules(PbCreator& pb_creator,
                        const std::string& request,
                        const boost::optional<const std::string>& calendar_id,
                        const std::vector<std::string>& forbidden_uris,
                        const pt::ptime date,
                        const uint32_t duration,
                        const uint32_t depth,
                        const int count,
                        const int start_page,
                        const size_t items_per_route_point) {
    RequestHandle handler(pb_creator, date, duration, calendar_id);
    handler.init_jpp(request, forbidden_uris);
    log4cplus::Logger logger = log4cplus::Logger::getInstance("log");

    if (pb_creator.has_error() || (handler.journey_pattern_points.size() == 0)) {
        return;
    }

    if (calendar_id) {
        // check whether that calendar exists, to raise an early error
        if (pb_creator.data->pt_data->calendars_map.find(*calendar_id)
            == pb_creator.data->pt_data->calendars_map.end()) {
            pb_creator.fill_pb_error(pbnavitia::Error::bad_filter, "stop_schedules : calendar does not exist");
            return;
        }
    }
    //  <stop_point_route, status>
    std::map<routing::JppIdx, pbnavitia::ResponseStatus> response_status;

    std::map<routing::JppIdx, vector_dt_st> map_route_stop_point;
    std::map<routing::JppIdx, first_and_last_stop_time> map_route_point_first_last_st;

    using LinePointIdx = std::pair<routing::LineIdx, routing::SpIdx>;
    // group JourneyPatternEndsByDirection by StopPoint and Line so that directions at different
    // stop points or different lines stay separated
    std::map<LinePointIdx, std::vector<JourneyPatternEndsByDirection>> jp_ends_by_directions_from_lp;
    // Iterate over all JP final parts (from JPP to the end)
    for (const auto& jpp_idx : handler.journey_pattern_points) {
        const auto& jp_end = pb_creator.data->dataRaptor->jp_container.get(jpp_idx);
        const auto& jp = pb_creator.data->dataRaptor->jp_container.get(jp_end.jp_idx);
        if (jp_end.order.val == jp.jpps.size() - 1) {  // no use considering cases where JPP is the terminus for departures
            continue;
        }
        const type::Route* route = pb_creator.data->pt_data->routes[jp.route_idx.val];
        LinePointIdx key_lp = {routing::LineIdx(route->line->idx), jp_end.sp_idx};
        auto jp_ends_by_directions_it = jp_ends_by_directions_from_lp.find(key_lp);
        bool is_jp_end_associated_to_a_direction = false;
        if (jp_ends_by_directions_it != jp_ends_by_directions_from_lp.end()) {
            // StopPoint already has directions associated, exploring them to see if:
            // 1. current JP's final part is included in one direction
            // 2. or if JP's final part includes some already existing directions
            std::vector<size_t> to_erase;
            boost::optional<JourneyPatternEndsByDirection&> referent_direction_for = boost::none;
            for (size_t jp_ends_by_dir_it = 0; jp_ends_by_dir_it < jp_ends_by_directions_it->second.size();
                 ++jp_ends_by_dir_it) {
                auto& jp_ends_by_direction = jp_ends_by_directions_it->second[jp_ends_by_dir_it];
                const auto& direction = pb_creator.data->dataRaptor->jp_container.get(jp_ends_by_direction.direction);
                // 1. jp_end is included in one direction :  associate that JP's final part to this direction
                if (is_jp_end_included_in_direction(jp_end, direction, pb_creator.data->dataRaptor->jp_container)) {
                    jp_ends_by_direction.jp_ends.push_back(jpp_idx);  // associate to direction
                    is_jp_end_associated_to_a_direction = true;
                    break;
                }
                // 2. If a jp_end includes a referent direction it becomes referent direction for that group of jp_ends.
                // NB: A new jp_end can "reconciliate" multiple group of jp_ends that were separated
                // (include their referent directions), in that case they are all merged.
                if (is_jp_end_included_in_direction(direction, jp_end, pb_creator.data->dataRaptor->jp_container)) {
                    if (!referent_direction_for) {
                        referent_direction_for = jp_ends_by_direction;  // richest direction is the first one we found
                        referent_direction_for->direction = jpp_idx;    // jp_end is now the referent direction
                        referent_direction_for->jp_ends.push_back(jpp_idx);  // associate to direction
                    } else {
                        // merge into richest direction and list direction to be erased
                        referent_direction_for->jp_ends.insert(referent_direction_for->jp_ends.end(),
                                                               jp_ends_by_direction.jp_ends.begin(),
                                                               jp_ends_by_direction.jp_ends.end());
                        to_erase.push_back(jp_ends_by_dir_it);
                    }
                    is_jp_end_associated_to_a_direction = true;
                }
            }
            while (to_erase.size()) {
                // erase from the end to keep valid indexes to erase
                jp_ends_by_directions_it->second.erase(jp_ends_by_directions_it->second.begin() + to_erase.back());
                to_erase.pop_back();
            }
        }
        if (!is_jp_end_associated_to_a_direction) {
            // StopPoint has no direction associated yet, creating it and associate current direction
            // (with only one JP final part: the direction itself)
            jp_ends_by_directions_from_lp[key_lp].emplace_back(jpp_idx);
            jp_ends_by_directions_from_lp[key_lp].back().jp_ends.push_back(jpp_idx);
        }
    }

    std::vector<JourneyPatternEndsByDirection> jp_ends_by_directions;
    for (auto vec_jp_ends_by_dirs : jp_ends_by_directions_from_lp) {
        jp_ends_by_directions.insert(jp_ends_by_directions.end(), vec_jp_ends_by_dirs.second.begin(),
                                     vec_jp_ends_by_dirs.second.end());
    }

    size_t total_result = jp_ends_by_directions.size();
    jp_ends_by_directions = paginate(jp_ends_by_directions, count, start_page);
    auto sort_predicate = [](routing::datetime_stop_time dt1, routing::datetime_stop_time dt2) {
        return dt1.first < dt2.first;
    };

    for (const auto& jp_ends_one_dir : jp_ends_by_directions) {
        const auto& jpp_dir = pb_creator.data->dataRaptor->jp_container.get(jp_ends_one_dir.direction);
        const auto& jp_dir = pb_creator.data->dataRaptor->jp_container.get(jpp_dir.jp_idx);
        const type::Route* route = pb_creator.data->pt_data->routes[jp_dir.route_idx.val];
        const type::StopPoint* stop_point = pb_creator.data->pt_data->stop_points[jpp_dir.sp_idx.val];

        const auto routepoint_jpps = jp_ends_one_dir.jp_ends;
        const auto& route_point = jp_ends_one_dir.direction;

        std::vector<routing::datetime_stop_time> stop_times;
        int32_t utc_offset = 0;
        if (!calendar_id) {
            stop_times =
                routing::get_stop_times(routing::StopEvent::pick_up, routepoint_jpps, handler.date_time,
                                        handler.max_datetime, items_per_route_point, *pb_creator.data,
                                        navitia::type::RTLevel::Base);
            std::sort(stop_times.begin(), stop_times.end(), sort_predicate);

            if (route->line->opening_time && !stop_times.empty()) {
                // retrieve utc offset
                utc_offset = stop_times[0].second->vehicle_journey->utc_to_local_offset();

                // first and last Date time
                map_route_point_first_last_st[route_point] = get_first_and_last_stop_time(
                        stop_times[0], *route->line->opening_time, routepoint_jpps,
                        handler.date_time + DateTimeUtils::SECONDS_PER_DAY, *pb_creator.data,
                        navitia::type::RTLevel::Base, utc_offset);
            }

        } else {
            stop_times = routing::get_calendar_stop_times(routepoint_jpps, DateTimeUtils::hour(handler.date_time),
                                                          DateTimeUtils::hour(handler.max_datetime), *pb_creator.data,
                                                          *calendar_id);
            // for calendar we want the first stop time to start from handler.date_time
            std::sort(stop_times.begin(), stop_times.end(), routing::CalendarScheduleSort(handler.date_time));
            if (stop_times.size() > items_per_route_point) {
                stop_times.resize(items_per_route_point);
            }
        }

        // If we have a calendar_id we have stop_times at the terminus and can use them to check
        // if the current stop is a terminus or a partial terminus
        if (calendar_id) {
            // If all stop_times are on the terminus of their vj
            // (stop_time order is equal to the order of the last stop_time of the vj)
            if (is_terminus_for_all_stop_times(stop_times)) {                
                if (stop_point->stop_area == route->destination) {
                    response_status[route_point] = pbnavitia::ResponseStatus::terminus;
                    LOG4CPLUS_DEBUG(logger, " *** Terminus in calendar_id ***");
                } else {
                    // Otherwise it's a partial_terminus
                    response_status[route_point] = pbnavitia::ResponseStatus::partial_terminus;
                    LOG4CPLUS_DEBUG(logger, " *** Partial terminus in calendar_id ***");
                }
            }
        }

        // If there is no departure for a request with "RealTime", Test existence of any departure with "base_schedule"
        // If departure with base_schedule is not empty, additional_information = active_disruption
        // Else additional_information = no_departure_this_day
        if (stop_times.empty() && (response_status.find(route_point) == response_status.end())) {
            auto resp_status = pbnavitia::ResponseStatus::no_departure_this_day;
            if (line_closed(navitia::seconds(duration), route, date)) {
                resp_status = pbnavitia::ResponseStatus::no_active_circulation_this_day;
            }

            // If we have no calendar terminuses have no pick_up stop_time, we try to get drop_off time
            // to see if it's just a terminus
            if (!calendar_id) {
                auto tmp_stop_times =
                    routing::get_stop_times(routing::StopEvent::drop_off, routepoint_jpps, handler.date_time,
                                            handler.max_datetime, items_per_route_point, *pb_creator.data,
                                            navitia::type::RTLevel::Base);
                // If there is stop_times and everyone of them is a terminus
                if (!tmp_stop_times.empty() && is_terminus_for_all_stop_times(tmp_stop_times)) {
                    // If we are on the main destination
                    if (stop_point->stop_area == route->destination) {                        
                        resp_status = pbnavitia::ResponseStatus::terminus;
                        LOG4CPLUS_DEBUG(logger, " *** Terminus in !calendar_id ***");
                    } else {
                        // Otherwise it's a partial_terminus
                        resp_status = pbnavitia::ResponseStatus::partial_terminus;
                        LOG4CPLUS_DEBUG(logger, " *** Partial terminus in !calendar_id ***");
                    }
                }
            }
            response_status[route_point] = resp_status;
        }

        map_route_stop_point[route_point] = stop_times;
    }

    render(pb_creator, response_status, map_route_stop_point, map_route_point_first_last_st, handler.date_time,
           handler.max_datetime, calendar_id, depth);

    pb_creator.make_paginate(total_result, start_page, count, pb_creator.terminus_schedules_size());
}

std::pair<DateTime, DateTime> get_daily_opening_time_bounds(const routing::datetime_stop_time& next_stop_time,
                                                            const uint32_t opening_time) {
    uint nb_days =
        DateTimeUtils::date(next_stop_time.first);  // Nb days from the data set origin until the next stop time.

    // sometimes a departure_time(stop_time) may exceed 24H and we suppose it doesn't exceed 48H
    uint32_t dep_time = math_mod(next_stop_time.second->departure_time, DateTimeUtils::SECONDS_PER_DAY);
    if (dep_time < opening_time) {
        return std::make_pair((nb_days - 1) * DateTimeUtils::SECONDS_PER_DAY + opening_time - 1,
                              nb_days * DateTimeUtils::SECONDS_PER_DAY + opening_time - 1);
    }
    return std::make_pair(nb_days * DateTimeUtils::SECONDS_PER_DAY + opening_time - 1,
                          (nb_days + 1) * DateTimeUtils::SECONDS_PER_DAY + opening_time - 1);
}

first_and_last_stop_time get_first_and_last_stop_time(const routing::datetime_stop_time& next_stop_time,
                                                      const pt::time_duration& opening_time,
                                                      const std::vector<routing::JppIdx>& journey_pattern_points,
                                                      const DateTime max_datetime,
                                                      const type::Data& data,
                                                      const type::RTLevel rt_level,
                                                      const int utc_offset) {
    // if the opening_time is 03:00(local_time) and the utc_offset is 5 hours, we want 22:00(UTC) as opening time
    int local_opening_time = math_mod(opening_time.total_seconds() - utc_offset, DateTimeUtils::SECONDS_PER_DAY);
    assert(local_opening_time > 0);

    auto new_request_date_times =
        get_daily_opening_time_bounds(next_stop_time, static_cast<uint32_t>(local_opening_time));

    // get first stop time
    auto first_times = routing::get_stop_times(routing::StopEvent::pick_up, journey_pattern_points,
                                               new_request_date_times.first, max_datetime, 1, data, rt_level);
    // get last stop time
    auto last_times =
        routing::get_stop_times(routing::StopEvent::pick_up, journey_pattern_points, new_request_date_times.second,
                                0,  // clockwise = false
                                1, data, rt_level);

    first_and_last_stop_time results;
    if (!first_times.empty()) {
        results.first = first_times[0];
    } else {
        results.first = boost::none;
    }
    if (!last_times.empty()) {
        results.second = last_times[0];
    } else {
        results.second = boost::none;
    }
    return results;
}

}  // namespace timetables
}  // namespace navitia
