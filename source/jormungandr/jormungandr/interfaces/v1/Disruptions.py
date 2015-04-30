# coding=utf-8

#  Copyright (c) 2001-2014, Canal TP and/or its affiliates. All rights reserved.
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

from flask.ext.restful import marshal_with, reqparse, fields
from flask.globals import g
from jormungandr import i_manager, timezone
from jormungandr.interfaces.v1.fields import PbField, error, network, line,\
    NonNullList, NonNullNested, pagination, stop_area, format_datetime
from jormungandr.interfaces.v1.ResourceUri import ResourceUri
from jormungandr.interfaces.argument import ArgumentDoc
from jormungandr.interfaces.parsers import date_time_format
from jormungandr.interfaces.v1.errors import ManageError
from datetime import datetime
import aniso8601
from datetime import timedelta
from jormungandr.interfaces.v1.fields import DisruptionsField
from copy import deepcopy
import sys

disruption = {
    "network": PbField(network, attribute='network'),
    "lines": NonNullList(NonNullNested(line)),
    "stop_areas": NonNullList(NonNullNested(stop_area))
}

traffic = {
    "traffic_reports": NonNullList(NonNullNested(disruption), attribute='disruptions'),
    "error": PbField(error, attribute='error'),
    "pagination": NonNullNested(pagination),
    "disruptions": DisruptionsField,
}



class TrafficReport(ResourceUri):
    def __init__(self):
        ResourceUri.__init__(self)
        self.parsers = {}
        self.parsers["get"] = reqparse.RequestParser(argument_class=ArgumentDoc)
        parser_get = self.parsers["get"]
        parser_get.add_argument("depth", type=int, default=1)
        parser_get.add_argument("count", type=int, default=10,
                                description="Number of disruptions per page")
        parser_get.add_argument("start_page", type=int, default=0,
                                description="The current page")
        parser_get.add_argument("_current_datetime", type=date_time_format, default=datetime.utcnow(),
                                description="The datetime we want to publish the disruptions from."
                                            " Default is the current date and it is mainly used for debug.")
        parser_get.add_argument("forbidden_id[]", type=unicode,
                                description="forbidden ids",
                                dest="forbidden_uris[]",
                                action="append")
        parser_get.add_argument("distance", type=int, default=200,
                                description="Distance range of the query. Used only if a coord is in the query")

    @marshal_with(traffic)
    @ManageError()
    def get(self, region=None, lon=None, lat=None, uri=None):
        self.region = i_manager.get_region(region, lon, lat)
        timezone.set_request_timezone(self.region)
        args = self.parsers["get"].parse_args()

        if uri:
            if uri[-1] == "/":
                uri = uri[:-1]
            uris = uri.split("/")
            args["filter"] = self.get_filter(uris, args)
        else:
            args["filter"] = ""

        response = i_manager.dispatch(args, "disruptions", instance_name=self.region)

        return response

"""
Note: the 'generic_messages' are the old 'disruptions'

For the moment we output both object, but we want to remove the generic_message as soon as possible
"""

class GenericMessage(fields.Raw):
    """
    create old message interface from disruption
    """
    def output(self, key, obj):
        res = []
        for d in obj.disruptions:
            message = None
            if d.messages:
                message = d.messages[0].text
            min_date = sys.maxint
            max_date = None
            for date in d.application_periods:
                min_date = min(min_date, date.begin)
                max_date = max(max_date, date.end)
            level = 'warning'
            if d.severity.effect == 'NO_SERVICE':
                level = 'disrupt'

            tz = timezone.get_timezone()
            generic_message = {
                "level": level,
                "value": message,
                "start_application_date": format_datetime(min_date, tz),
                "end_application_date": format_datetime(max_date, tz),
                "start_application_daily_hour": '000000',
                "end_application_daily_hour": '235959',
            }
            res.append(generic_message)

        return res

network_with_messages = deepcopy(network)
line_with_messages = deepcopy(line)
stop_area_with_messages = deepcopy(stop_area)

del network_with_messages['links']
del line_with_messages['links']
del stop_area_with_messages['links']
network_with_messages["messages"] = GenericMessage()
line_with_messages["messages"] = GenericMessage()
stop_area_with_messages["messages"] = GenericMessage()

disruptions_old = {
    "network": PbField(network_with_messages, attribute='network'),
    "lines": NonNullList(NonNullNested(line_with_messages)),
    "stop_areas": NonNullList(NonNullNested(stop_area_with_messages))
}
disruption_api = {"disruptions": NonNullList(NonNullNested(disruptions_old), attribute='disruptions'),
                }

def duration(param):
    try:
        return aniso8601.parse_duration(param)
    except ValueError as e:
        raise ValueError("Unable to parse duration {}, {}".format(param, e.message))


class Disruptions(ResourceUri):
    def __init__(self):
        ResourceUri.__init__(self)
        self.parsers = {}
        self.parsers["get"] = reqparse.RequestParser(argument_class=ArgumentDoc)
        parser_get = self.parsers["get"]
        parser_get.add_argument("depth", type=int, default=1)
        parser_get.add_argument("count", type=int, default=10,
                                description="Number of disruptions per page")
        parser_get.add_argument("start_page", type=int, default=0, description="The current page")
        parser_get.add_argument("_current_datetime", type=date_time_format, default=datetime.utcnow(),
                                description="The datetime we want to publish the disruptions from."
                                " Default is the current date and it is mainly used for debug.")
        parser_get.add_argument("forbidden_id[]", type=unicode, description="forbidden ids",
                                dest="forbidden_uris[]", action="append")

    @marshal_with(disruption_api)
    @ManageError()
    def get(self, region=None, lon=None, lat=None, uri=None):
        self.region = i_manager.get_region(region, lon, lat)
        timezone.set_request_timezone(self.region)
        args = self.parsers["get"].parse_args()

        if uri:
            if uri[-1] == "/":
                uri = uri[:-1]
            uris = uri.split("/")
            args["filter"] = self.get_filter(uris)
        else:
            args["filter"] = ""

        self._register_interpreted_parameters(args)

        response = i_manager.dispatch(args, "disruptions", instance_name=self.region)

        # we store in g if we want the disruptions in the old or in the new format
        # It's not well designed, but it is temporary
        # DELETE that asap

        return response


