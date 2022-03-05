from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__, static_folder="files", static_url_path="/files")
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///files/app.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['DEBUG'] = True
db = SQLAlchemy(app)
CORS(app)
