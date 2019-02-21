#  Copyright (c) 2001-2016, Canal TP and/or its affiliates. All rights reserved.
#
# This file is part of Navitia,
#     the software to build cool stuff with public transport.
#
# Hope you'll enjoy and contribute to this project,
#     powered by Canal TP (www.canaltp.fr).
# Help us simplify mobility and open public transport:
#     a non ending quest to the responsive locomotion way of traveling!
#
# LICENCE: This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# Stay tuned using
# twitter @navitia
# IRC #navitia on freenode
# https://groups.google.com/d/forum/navitia
# www.navitia.io

import logging
from jormungandr.street_network.street_network import AbstractStreetNetworkService
from jormungandr import street_network, utils
from jormungandr.utils import get_pt_object_coord

from jormungandr.street_network.asgard import Asgard
from navitiacommon import response_pb2


class WithParking(AbstractStreetNetworkService):
    def __init__(self, instance, service_url, modes=None, id=None, timeout=10, api_key=None, **kwargs):
        self.instance = instance
        self.modes = modes or []
        self.sn_system_id = id or 'with_parking'
        self.parking_module = utils.create_object(kwargs.get('parking', None))
        config = kwargs.get('street_network', None)
        if 'service_url' not in config['args']:
            config['args'].update({'service_url': None})
        if 'instance' not in config['args']:
            config['args'].update({'instance': instance})

        config['args'].update({'modes': self.modes})
        self.street_network = utils.create_object(config)

    def status(self):
        return {'id': unicode(self.sn_system_id), 'class': self.__class__.__name__, 'modes': self.modes}

    def _direct_path(
        self, mode, pt_object_origin, pt_object_destination, fallback_extremity, request, direct_path_type
    ):
        response = self.street_network._direct_path(
            mode, pt_object_origin, pt_object_destination, fallback_extremity, request, direct_path_type
        )
        if response and len(response.journeys):
            self.add_parking_section_in_direct_path(response, pt_object_destination)

        return response

    def add_parking_section_in_direct_path(self, response, pt_object_destination):
        logger = logging.getLogger(__name__)
        logger.info("Creating parking section for direct path")

        for journey in response.journeys:
            section = journey.sections.add()
            journey.nb_sections += 1

            # The origin and destination of the parking section is the destination of the journey
            section.origin.CopyFrom(pt_object_destination)
            section.destination.CopyFrom(pt_object_destination)
            # And we have to complete the destination of the first section ourself
            # Because Jormun does not do it afterwards
            journey.sections[0].destination.CopyFrom(pt_object_destination)

            section.duration = self.parking_module.get_parking_duration(
                get_pt_object_coord(pt_object_destination)
            )
            journey.duration += self.parking_module.get_parking_duration(
                get_pt_object_coord(pt_object_destination)
            )
            journey.durations.total += self.parking_module.get_parking_duration(
                get_pt_object_coord(pt_object_destination)
            )

            section.type = response_pb2.PARK
            section.id = 'section_1'

            section.begin_date_time = journey.sections[0].end_date_time
            section.end_date_time = section.begin_date_time + section.duration
            journey.arrival_date_time += self.parking_module.get_parking_duration(
                get_pt_object_coord(pt_object_destination)
            )

    def get_street_network_routing_matrix(
        self, origins, destinations, street_network_mode, max_duration, request, **kwargs
    ):
        response = self.street_network.get_street_network_routing_matrix(
            origins, destinations, street_network_mode, max_duration, request, **kwargs
        )

        if response and len(response.rows) and len(response.rows[0].routing_response):
            self.add_parking_time_in_routing_matrix(response.rows[0].routing_response, origins, destinations)

        return response

    def add_parking_time_in_routing_matrix(self, response, origins, destinations):
        if len(origins) == 1:
            # The parking time depends on the place we want to park in
            self.add_additionnal_parking_time(response, destinations)
        else:
            self.add_additionnal_leave_parking_time(response)

    def add_additionnal_parking_time(self, response, destinations):
        # The response and the destination related to this response are ordered the same way
        for r, dest in zip(response, destinations):
            if r.routing_status == response_pb2.reached:
                r.duration += self.parking_module.get_parking_duration(dest)

    def add_additionnal_leave_parking_time(self, response):
        additionnal_leave_parking_time = self.parking_module.get_leave_parking_duration()
        for r in response:
            r.duration += additionnal_leave_parking_time

    def make_path_key(self, mode, orig_uri, dest_uri, streetnetwork_path_type, period_extremity):
        """
        :param orig_uri, dest_uri, mode: matters obviously
        :param streetnetwork_path_type: whether it's a fallback at
        the beginning, the end of journey or a direct path without PT also matters especially for car (to know if we
        park before or after)
        :param period_extremity: is a PeriodExtremity (a datetime and its meaning on the
        fallback period)
        Nota: period_extremity is not taken into consideration so far because we assume that a
        direct path from A to B remains the same even the departure time are different (no realtime)
        """

        return self.street_network.make_path_key(mode, orig_uri, dest_uri, streetnetwork_path_type, None)