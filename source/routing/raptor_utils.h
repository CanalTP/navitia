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

#pragma once

#include "type/datetime.h"
#include "utils/idx_map.h"
#include "type/fwd_type.h"

#include <boost/container/flat_map.hpp>
#include <boost/range/algorithm/fill.hpp>

namespace navitia {
namespace routing {

using JppIdx = Idx<JourneyPatternPoint>;
using JpIdx = Idx<JourneyPattern>;
using SpIdx = Idx<type::StopPoint>;
using RouteIdx = Idx<type::Route>;
using LineIdx = Idx<type::Line>;
using VjIdx = Idx<type::VehicleJourney>;
using MvjIdx = Idx<type::MetaVehicleJourney>;
using PhyModeIdx = Idx<type::PhysicalMode>;

using map_stop_point_duration = boost::container::flat_map<SpIdx, navitia::time_duration>;
using map_jpp_duration = boost::container::flat_map<JppIdx, navitia::time_duration>;

inline bool is_dt_initialized(const DateTime dt) {
    return dt != DateTimeUtils::inf && dt != DateTimeUtils::min;
}

}  // namespace routing
}  // namespace navitia
