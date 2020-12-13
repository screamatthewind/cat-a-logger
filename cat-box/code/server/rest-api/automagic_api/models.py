from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import backref, relationship
from automagic_api import Base


class Catalogger(Base):
    @declared_attr
    def __tablename__(cls):
        return cls.__name__.lower()

    id = Column(Integer, primary_key=True)
    eventType = Column(Integer)
    voltage = Column(String(64))
