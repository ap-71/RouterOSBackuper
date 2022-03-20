from pprint import pprint

from flask import request

from configure import app
from models import actions
from utils.jsonSkeleton import JSONSkeleton


# @app.route('/', defaults={'path': ''})
# @app.route('/<path:path>')
# def main(path):
#     # return app.send_static_file("index.html")
#     return send_from_directory("templates", 'index.html')


@app.route('/api/<action>', methods=['GET', 'POST', 'OPTIONS'])
def api(action):
    kwargs_ = {key: request.args.get(key) for key in request.args.keys()}
    action_ = actions.get(action)
    kwargs_['method'] = request.method
    if action_ is not None:
        return action_(**kwargs_)
    return JSONSkeleton().json


if __name__ == '__main__':
    app.run()
