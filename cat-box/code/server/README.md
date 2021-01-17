# Restful implentation influenced by https://github.com/cyberj0g/flask-deploy/  

# POST - Status Update 
{"voltage": "11.0", "eventType": 1}

# POST - Motion Detected
{"eventType": 0}

class EventType:
    MOTION_DETECTED = 0
    STATUS_UPDATE = 1