# Copyright (c) 2001-2015, Canal TP and/or its affiliates. All rights reserved.
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
from __future__ import absolute_import, print_function, unicode_literals, division
from .tests_mechanism import AbstractTestFixture
from datetime import timedelta
from .tests_mechanism import config
from .check_utils import *
from nose.tools import eq_
from jormungandr.scenarios.qualifier import min_from_criteria
from .journey_common_tests import *
from unittest import skip
from .routing_tests import OnBasicRouting

'''
This unit runs all the common tests in journey_common_tests.py along with locals tests added in this
unit for scenario experimental
'''

@config({'scenario': 'experimental'})
class TestJourneysExperimental(JourneyCommon, DirectPath, AbstractTestFixture):
    """
    Test the experiental scenario
    All the tests are defined in "TestJourneys" class, we only change the scenario


    NOTE: for the moment we cannot import all routing tests, so we only get 2, but we need to add some more
    """

    @staticmethod
    def check_next_datetime_link(dt, response, clockwise):
        if not response.get('journeys'):
            return
        """default next behaviour is 1s after the best or the soonest"""
        j_to_compare = min_from_criteria(generate_pt_journeys(response),
                                         new_default_pagination_journey_comparator(clockwise=clockwise))

        j_departure = get_valid_datetime(j_to_compare['departure_date_time'])
        eq_(j_departure + timedelta(seconds=1), dt)

    @staticmethod
    def check_previous_datetime_link(dt, response, clockwise):
        if not response.get('journeys'):
            return
        """default previous behaviour is 1s before the best or the latest """
        j_to_compare = min_from_criteria(generate_pt_journeys(response),
                                         new_default_pagination_journey_comparator(clockwise=clockwise))

        j_departure = get_valid_datetime(j_to_compare['arrival_date_time'])
        eq_(j_departure - timedelta(seconds=1), dt)

    @skip("temporarily disabled")
    def test_best_filtering(self):
        super(JourneyCommon, self).test_best_filtering()

    @skip("temporarily disabled")
    def test_datetime_represents_arrival(self):
        super(JourneyCommon, self).test_datetime_represents_arrival()

    @skip("temporarily disabled")
    def test_journeys_wheelchair_profile(self):
        super(JourneyCommon, self).test_journeys_wheelchair_profile()

    @skip("temporarily disabled")
    def test_not_existent_filtering(self):
        super(JourneyCommon, self).test_not_existent_filtering()

    @skip("temporarily disabled")
    def test_other_filtering(self):
        super(JourneyCommon, self).test_other_filtering()

    @skip("temporarily disabled")
    def test_speed_factor_direct_path(self):
        super(JourneyCommon, self).test_speed_factor_direct_path()

    @skip("temporarily disabled")
    def test_traveler_type(self):
        super(JourneyCommon, self).test_traveler_type()

    def test_max_duration_to_pt_equals_to_0(self):
        query = journey_basic_query + \
            "&first_section_mode[]=bss" + \
            "&first_section_mode[]=walking" + \
            "&first_section_mode[]=bike" + \
            "&first_section_mode[]=car" + \
            "&debug=true"
        response = self.query_region(query)
        check_journeys(response)
        eq_(len(response['journeys']), 4)

        query += "&max_duration_to_pt=0"
        response = self.query_region(query)
        check_journeys(response)
        # the pt journey is eliminated
        eq_(len(response['journeys']), 3)

        # first is bike
        assert('bike' in response['journeys'][0]['tags'])
        eq_(len(response['journeys'][0]['sections']), 1)

        # second is car
        assert('car' in response['journeys'][1]['tags'])
        eq_(len(response['journeys'][1]['sections']), 3)

        # last is walking
        assert('walking' in response['journeys'][-1]['tags'])
        eq_(len(response['journeys'][-1]['sections']), 1)

    def test_max_duration_to_pt_equals_to_0_from_stop_point(self):
        query = "journeys?from=stop_point%3AstopA&to=stop_point%3AstopC&datetime=20120614T080000"
        response = self.query_region(query)
        check_journeys(response)
        eq_(len(response['journeys']), 2)

        query += "&max_duration_to_pt=0"
        response = self.query_region(query)
        check_journeys(response)
        eq_(len(response['journeys']), 2)

    def test_max_duration_equals_to_0(self):
        query = journey_basic_query + \
            "&first_section_mode[]=bss" + \
            "&first_section_mode[]=walking" + \
            "&first_section_mode[]=bike" + \
            "&first_section_mode[]=car" + \
            "&debug=true"
        response = self.query_region(query)
        check_journeys(response)
        eq_(len(response['journeys']), 4)

        query += "&max_duration=0"
        response = self.query_region(query)
        check_journeys(response)
        # the pt journey is eliminated
        eq_(len(response['journeys']), 3)

        # first is bike
        assert('bike' in response['journeys'][0]['tags'])
        eq_(response['journeys'][0]['debug']['internal_id'], 'dp_43-0')
        eq_(len(response['journeys'][0]['sections']), 1)

        # second is car
        assert('car' in response['journeys'][1]['tags'])
        eq_(response['journeys'][1]['debug']['internal_id'], "dp_44-0")
        eq_(len(response['journeys'][1]['sections']), 3)

        # last is walking
        assert('walking' in response['journeys'][-1]['tags'])
        eq_(response['journeys'][-1]['debug']['internal_id'], "dp_42-0")
        eq_(len(response['journeys'][-1]['sections']), 1)

    def test_journey_stop_area_to_stop_point(self):
        """
        When the departure is stop_area:A and the destination is stop_point:B belonging to stop_area:B
        """
        query = "journeys?from={from_sa}&to={to_sa}&datetime={datetime}"\
            .format(from_sa='stopA', to_sa='stop_point:stopB', datetime="20120614T080000")
        response = self.query_region(query)
        check_journeys(response)
        jrnys = response['journeys']

        j = next((j for j in jrnys if j['type'] == 'non_pt_walk'), None)
        assert j
        assert j['sections'][0]['from']['id'] == 'stopA'
        assert j['sections'][0]['to']['id'] == 'stop_point:stopB'
        assert 'walking' in j['tags']

    def test_crow_fly_sections(self):
        """
        When the departure is a stop_area...
        """
        query = "journeys?from={from_sa}&to={to_sa}&datetime={datetime}"\
            .format(from_sa='stopA', to_sa='stopB', datetime="20120614T080000")
        response = self.query_region(query)
        check_journeys(response)
        jrnys = response['journeys']
        assert len(jrnys) == 2
        section_0 = jrnys[0]['sections'][0]
        assert section_0['type'] == 'crow_fly'
        assert section_0['from']['id'] == 'stopA'
        assert section_0['to']['id'] == 'stop_point:stopA'

        section_2 = jrnys[0]['sections'][2]
        assert section_2['type'] == 'crow_fly'
        assert section_2['from']['id'] == 'stop_point:stopB'
        assert section_2['to']['id'] == 'stopB'

@config({"scenario": "experimental"})
class TestExperimentalJourneysWithPtref(JourneysWithPtref, AbstractTestFixture):
    pass


@dataset({"basic_routing_test": {"scenario": "new_default"}})
class TestNewDefaultOnBasicRouting(OnBasicRouting, AbstractTestFixture):

    @skip("temporarily disabled")
    def test_journeys_with_show_codes(self):
        super(OnBasicRouting, self).test_journeys_with_show_codes()

    @skip("temporarily disabled")
    def test_journeys_without_show_codes(self):
        super(OnBasicRouting, self).test_journeys_without_show_codes()

    @skip("temporarily disabled")
    def test_novalidjourney_on_first_call(self):
        super(OnBasicRouting, self).test_novalidjourney_on_first_call()


    @skip("temporarily disabled")
    def test_novalidjourney_on_first_call_debug(self):
        super(OnBasicRouting, self).test_novalidjourney_on_first_call_debug()
