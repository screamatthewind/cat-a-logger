import flask
import flask_sqlalchemy

import flask_restless

# Create the Flask application and the Flask-SQLAlchemy object.
app = flask.Flask(__name__)
app.config['DEBUG'] = True
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///catalogger.db'
db = flask_sqlalchemy.SQLAlchemy(app)


# Create your Flask-SQLAlchemy models as usual but with the following
# restriction: they must have an __init__ method that accepts keyword
# arguments for all columns (the constructor in
# flask.ext.sqlalchemy.SQLAlchemy.Model supplies such a method, so you
# don't need to declare a new one).
class Catalogger(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    voltage = db.Column(db.String)
    eventType = db.Column(db.Integer)


# Create the database tables.
db.create_all()

# Create the Flask-Restless API manager.
manager = flask_restless.APIManager(app, flask_sqlalchemy_db=db)

# Create API endpoints, which will be available at /api/<tablename> by
# default. Allowed HTTP methods can be specified as well.
manager.create_api(Catalogger, methods=['GET', 'POST', 'DELETE'])

# start the flask loop
app.run()
