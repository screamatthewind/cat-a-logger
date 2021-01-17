import logging

from flask import jsonify
from flask_restful import Api, Resource, reqparse

import config

from capture import vc
from EventType import EventType

api = Api(prefix=config.API_PREFIX)

parser = reqparse.RequestParser()
parser.add_argument('eventType')

logger = logging.getLogger(__name__)

class ProcessEvent(Resource):
    def post(self):
        args = parser.parse_args()
        eventType = int(args['eventType'])

        if eventType == EventType.MOTION_DETECTED:
            logger.info("Motion Detected")
            vc.start_capture()

        elif eventType == EventType.STATUS_UPDATE:
            logger.info("Status Update")

        else:
            logger.info("Unknown Status")

        return {
            'status': True
        }


class HealthCheck(Resource):
    def get(self):
        return {
            'status': True
        }


# data processing endpoint
api.add_resource(ProcessEvent, '/process_event')

# task status endpoint
api.add_resource(HealthCheck, '/health_check')

vc.start_thread()
