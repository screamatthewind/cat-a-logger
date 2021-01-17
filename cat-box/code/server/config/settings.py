class BaseConfig:
    API_PREFIX = "/api"
    DEBUG = False
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    VIDEO_CAPTURE_SECS = 10
    VIDEO_CAPTURE_MAX_SECS = 30
    VIDEO_CAPTURE_DIR = "D:/catalogger"
    VIDEO_CAPTURE_SOURCE = "rtsp://10.0.0.62:554/11"
    VIDEO_CAPTURE_PREFIX = "catalogger"


class DevConfig(BaseConfig):
    FLASK_ENV = "development"
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = "sqlite:///catalogger.db"
