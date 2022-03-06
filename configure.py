import sqlite3
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
from dotenv import load_dotenv
import os

from loguru import logger

load_dotenv()
ROOT_DIR = os.path.dirname(os.path.abspath(__file__))

def create_db():
    try:
        sqlite3.connect(os.path.join(ROOT_DIR, os.environ.get('DB_PATH')))
    except Exception as error:
        logger.error('Путь до базы не существует, создаю ...')
        os.makedirs(os.path.join(ROOT_DIR, '/'.join(os.environ.get('DB_PATH').split('/')[0:-1])), exist_ok=True)
        create_db()
        
app = Flask(__name__, static_folder="files", static_url_path="/files")
create_db()

app.config['SQLALCHEMY_DATABASE_URI'] = os.environ.get('DB_TYPE') + ':///'  + os.path.join(ROOT_DIR, os.environ.get('DB_PATH'))
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['DEBUG'] = True
db = SQLAlchemy(app)
CORS(app)
