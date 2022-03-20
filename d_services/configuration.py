import os

from dotenv import load_dotenv


load_dotenv()
SERVER_API = {
    "IP": os.environ.get('SERVER_API_IP', "127.0.0.1"),
    "PORT": os.environ.get('SERVER_API_PORT', "5000")
}