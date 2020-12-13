from automagic_api import manager
from automagic_api.models import Catalogger

catalogger_api_blueprint = manager.create_api_blueprint(Catalogger, methods=['GET', 'PATCH', 'POST', 'DELETE'])
