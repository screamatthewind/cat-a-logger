pip install -U flask
pip install -U Flask-SQLAlchemy
pip install -U flask-restless-ng

post_headers = {'Accept': 'application/vnd.api+json',
                'Content-Type': 'application/vnd.api+json'}

# POST - Status Update 
{"data": {"type": "catalogger", "attributes": {"voltage": "11.0", "eventType": 1}}}

# POST - Motion Detected
{"data": {"type": "catalogger", "attributes": {"eventType": 0}}}

class EventType:
    MOTION_DETECTED = 0
    STATUS_UPDATE = 1