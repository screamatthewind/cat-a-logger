import uuid
from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Catalogger(db.Model):
    id = db.Column(db.String(), primary_key=True, default=lambda: str(uuid.uuid4()))
    voltage = db.Column(db.String)
    eventType = db.Column(db.Integer)
    eventDateTime = db.Column(db.DateTime, nullable=False, default=datetime.now)