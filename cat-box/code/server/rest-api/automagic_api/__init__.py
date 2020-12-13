import flask
import flask_restless
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, scoped_session
from sqlalchemy import *

app = flask.Flask(__name__)

# Create our sqlalchemy DB engine
engine = create_engine('sqlite:///catalogger.db', connect_args={'check_same_thread': False})
Session = sessionmaker(bind=engine, autocommit=False,
autoflush=False)
s = scoped_session(Session)

Base = declarative_base()
Base.metadata.bind = engine

#Import all models to add them to Base.metadata
from .models import Catalogger
Base.metadata.create_all()

manager = flask_restless.APIManager(app, session=s)

#Register flask-restless blueprints to instantiate CRUD endpoints
from .controllers import catalogger_api_blueprint

app.register_blueprint(catalogger_api_blueprint)
