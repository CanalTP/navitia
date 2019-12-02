/* Copyright © 2001-2019, Canal TP and/or its affiliates. All rights reserved.

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

#include "type/comment.h"

#include "type/serialization.h"

namespace navitia {
namespace type {

template <class Archive>
void Comment::serialize(Archive& ar, const unsigned int /*unused*/) {
    ar& value& type;
}
SERIALIZABLE(Comment)

bool Comment::operator==(const Comment& other) const {
    return this->value == other.value && this->type == other.type;
}

std::ostream& operator<<(std::ostream& os, const Comment& comment) {
    return os << comment.value;
}

}  // namespace type
}  // namespace navitia
