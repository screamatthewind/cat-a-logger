class BaseConfig():
    API_PREFIX = '/api'
    DEBUG = False


class DevConfig(BaseConfig):
    FLASK_ENV = 'development'
    #DEBUG = True
    SQLALCHEMY_DATABASE_URI = 'sqlite:///catalogger.db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
