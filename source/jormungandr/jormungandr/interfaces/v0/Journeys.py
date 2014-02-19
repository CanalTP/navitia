# coding=utf-8
from flask import Flask, request
from flask.ext.restful import Resource, fields
from jormungandr import i_manager
from jormungandr.interfaces.parsers import true_false, option_value
from jormungandr.protobuf_to_dict import protobuf_to_dict
from jormungandr.find_extrem_datetimes import extremes
from flask.ext.restful import reqparse
from flask.ext.restful.types import boolean
from jormungandr.interfaces.argument import ArgumentDoc
from jormungandr.interfaces.parsers import depth_argument
from jormungandr.authentification import authentification_required


class Journeys(Resource):

    """ Compute journeys"""
    parsers = {}
    method_decorators = [authentification_required]

    def __init__(self, *args, **kwargs):
        types = ["all", "rapid"]
        self.parsers["get"] = reqparse.RequestParser(
            argument_class=ArgumentDoc)
        parser_get = self.parsers["get"]
        parser_get.add_argument("origin", type=str, required=True,
                                description="Origin's uri of your journey")
        parser_get.add_argument("destination", type=str, required=True,
                                description=
                                "Destination's uri of your journey")
        parser_get.add_argument("datetime", type=str, required=True,
                                description=
                                "Datetime's uri of your journey")
        parser_get.add_argument("clockwise", type=true_false, default=True,
                                description=
                                "Whether you want your journey to start"\
                                "after datetime or to end before datetime")
        parser_get.add_argument("max_duration", type=int, default=36000,
                                description="Maximum duration of your journey")
        parser_get.add_argument("max_transfers", type=int, default=10,
                                description=
                                "Maximum transfers you want in "\
                                "your journey")
        parser_get.add_argument("origin_mode",
                                type=option_value(["walking", "car", "bike",
                                                   "bss"]),
                                action="append", default=['walking', 'bike',
                                                          'car'],
                                description=
                                "The list of modes you want at the "\
                                "beggining of your journey")
        parser_get.add_argument("destination_mode",
                                type=option_value(["walking", "car", "bike",
                                                   "bss"]),
                                default=['walking', 'bike', 'car'],
                                action="append",
                                description=
                                "The list of modes you want at the"\
                                " end of your journey")
        parser_get.add_argument("max_duration_to_pt", type=int, default=10*60,
                                description=
                                "maximal duration of non public "\
                                "transport in second")
        parser_get.add_argument("walking_speed", type=float, default=1.68,
                                description=
                                "Walking speed in meter/second")
        parser_get.add_argument("bike_speed", type=float, default=8.8,
                                description="Bike speed in meter/second")
        parser_get.add_argument("bss_speed", type=float, default=8.8,
                                description="Bike rental speed in "\
                                "meter/second")
        parser_get.add_argument("car_speed", type=float, default=16.8,
                                description=
                                "Car speed in meter/second")
        parser_get.add_argument("forbidden_uris[]", type=str, action="append",
                                description="Uri you want to forbid")
        parser_get.add_argument("type", type=option_value(types),
                                default="all")
        parser_get.add_argument("wheelchair", type=boolean, default=False)
        parser_get.add_argument("disruption_active", type=boolean, default=False)
        parser_get.add_argument("count", type=int)
        parser_get.add_argument("debug", type=boolean, default=False,
                                hidden=True)

    def get(self, region=None):
        args = self.parsers["get"].parse_args()
        if region is None:
            region = i_manager.key_of_id(args["origin"])
        response = i_manager.dispatch(args, region, "journeys")
        if response.journeys:
            (before, after) = extremes(response, request)
            if before and after:
                response.prev = before
                response.next = after
        return protobuf_to_dict(response, use_enum_labels=True), 200


class Isochrone(Resource):

    """ Compute isochrones """
    method_decorators = [authentification_required]

    def __init__(self):
        self.parsers = {}
        self.parsers["get"] = reqparse.RequestParser()
        parser_get = self.parsers["get"]
        parser_get.add_argument("origin", type=str, required=True)
        parser_get.add_argument("datetime", type=str, required=True)
        parser_get.add_argument("clockwise", type=true_false, default=True)
        parser_get.add_argument("max_duration", type=int, default=3600)
        parser_get.add_argument("max_transfers", type=int, default=10)
        parser_get.add_argument("origin_mode",
                                type=option_value(["walking", "car", "bike",
                                                   "bss"]),
                                action="append", default=["walking"])
        parser_get.add_argument("max_duration_to_pt", type=int, default=10*60,
                                description="maximal duration of non public \
                                transport in second")
        parser_get.add_argument("walking_speed", type=float, default=1.68)
        parser_get.add_argument("bike_speed", type=float, default=8.8)
        parser_get.add_argument("bss_speed", type=float, default=8.8)
        parser_get.add_argument("car_speed", type=float, default=16.8)
        parser_get.add_argument("forbidden_uris[]", type=str, action="append")
        parser_get.add_argument("wheelchair", type=boolean, default=False)
        parser_get.add_argument("debug", type=boolean, default=False,
                                hidden=True)

    def get(self, region=None):
        args = self.parsers["get"].parse_args()
        if region is None:
            region = i_manager.key_of_id(args["origin"])
        response = i_manager.dispatch(args, region, "isochrone")
        if response.journeys:
            (before, after) = extremes(response, request)
            if before and after:
                response.prev = before
                response.next = after
        return protobuf_to_dict(response, use_enum_labels=True), 200
