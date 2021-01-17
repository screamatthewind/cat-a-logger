from flask import jsonify
from flask_restful import Api, Resource, reqparse

import config
from EventType import EventType

api = Api(prefix=config.API_PREFIX)

parser = reqparse.RequestParser()
parser.add_argument('eventType')

class ProcessEvent(Resource):
    def post(self):
        args = parser.parse_args()
        eventType = args['eventType']
        # eventType = int(kw["result"]["data"]["attributes"]["eventType"])
        # if eventType == EventType.MOTION_DETECTED:
        #     print("MOTION_DETECTED")
        # elif eventType == EventType.STATUS_UPDATE:
        #     print("STATUS_UPDATE")
        # else:
        #     print("UNKNOWN STATUS")
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
