from automagic_api import app, s, manager
from automagic_api.models import Book, Author

author_api_blueprint = manager.create_api_blueprint(Author, methods=['GET', 'PATCH', 'POST', 'DELETE'])
book_api_blueprint = manager.create_api_blueprint(Book, methods=['GET', 'PATCH', 'POST', 'DELETE'])
