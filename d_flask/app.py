import os
from pprint import pprint
from dotenv import load_dotenv

from flask import request

from configure import app
from models import actions
from utils.jsonSkeleton import JSONSkeleton


@app.route('/api/<action>', methods=['GET', 'POST', 'OPTIONS'])
def api(action):
    kwargs_ = {key: request.args.get(key) for key in request.args.keys()}
    action_ = actions.get(action)
    kwargs_['method'] = request.method
    if action_ is not None:
        return action_(**kwargs_)
    return JSONSkeleton().json


if __name__ == '__main__':
    load_dotenv()
    app.run(host=os.environ.get('SERVER_ACC_IP'), port=os.environ.get('SERVER_ACC_PORT'))
