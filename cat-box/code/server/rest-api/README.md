
# REST API WITH FLASK-RESTLESS AND sqlalchemy



## Summary
* This is a simple CRUD APP project that shows how to auto-generate a REST API from a handful of SQLalchemy models. This means full CRUD (POST, GET, PUT, DELETE) endpoint generation for each SQLalchemy model defined.

* Big shout out and thank you to Sean Harrington at http://thelaziestprogrammer.com/sharrington/web-development/sqlalchemy-defined-rest-api
https://github.com/stroupjason/REST-API-with-Flask-Restless-and-SQLAlchemy


## Environment Set up
1. Create a project in the root directory
    mkdir automagic_api

2. Create and activate a virtualenv
    cd automagic_api;

    #virtualenv env; latest version of Python and pip


    source env/bin/activate

3. Install flask_restless and sqlalchemy

    * pip install flask-restless sqlalchemy

## Start and test your API!
In the project root, start the server

env/bin/python run.py

In a python CLI (I chose to use ipython), create a POST request to create a new Book:

>>> import requests
>>> import json
>>> payload = { 
    "title": "The Eye of the World",
    "author": {
        "first_name": "Robert",
        "last_name": "Jordan"
        },  
    "is_available": true
}
>>> headers = {'content-type': 'application/json'}
>>> r = requests.post("http://localhost:5000/api/book", data=json.dumps(payload),headers=headers)
>>> print r.status_code
201

## Open A Web Browser
Go ahead and open up a web browser, and navigate to http://localhost:5000/api/book to see the Book object that you just POSTed to your sqlite database.

Likewise, you can invert this request and check out http://localhost:5000/api/author to see the Author object that was created, and the nested “books” attribute that the author has written.

Note: URLs for the API are constructed based off of the __tablename__ of the sqlalchemy model, and are prefixed with “/api” (i.e Book -> “/api/book”)

## Finished!
Congratulations, you now have a working boilerplate for a SQLAlchemy-model defined REST API. Now go ahead and add more models and endpoints!
