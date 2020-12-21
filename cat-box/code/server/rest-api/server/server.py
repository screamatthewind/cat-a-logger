import flask
import flask_sqlalchemy
import flask_restless
from EventType import EventType
from datetime import datetime


def check_event(instance_id=None, **kw):

    eventType = int(kw["result"]["data"]["attributes"]["eventType"])
    if eventType == EventType.MOTION_DETECTED:
        print("MOTION_DETECTED")
    elif eventType == EventType.STATUS_UPDATE:
        print("STATUS_UPDATE")
    else:
        print("UNKNOWN STATUS")


# Create the Flask application and the Flask-SQLAlchemy object.
app = flask.Flask(__name__)
app.config["DEBUG"] = True
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///catalogger.db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db = flask_sqlalchemy.SQLAlchemy(app)


class Catalogger(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    voltage = db.Column(db.String)
    eventType = db.Column(db.Integer)
    eventDateTime = db.Column(db.DateTime, nullable=False, default=datetime.utcnow)


# Create the database tables.
db.create_all()

# Create the Flask-Restless API manager.
manager = flask_restless.APIManager(
    app, flask_sqlalchemy_db=db, postprocessors=dict(POST_RESOURCE=[check_event])
)

# Create API endpoints, which will be available at /api/<tablename> by
# default. Allowed HTTP methods can be specified as well.
manager.create_api(Catalogger, methods=["GET", "POST", "DELETE"])


@app.route("/api/check")
def health_check():
    return "ok"


# start the flask loop
app.run(host="0.0.0.0")
