from flask import jsonify


class JSONSkeleton:
    def __init__(self, **kwargs):
        self._default_data = {
            'result': kwargs.get('result', False),
            'data': kwargs.get('data', [])
        }
        self._data = self._default_data.copy()

    @property
    def data(self):
        return self._data['data']

    @data.setter
    def data(self, data_: dict):
        self._data['result'] = True
        self._data['data'].append(data_)

    @property
    def result(self):
        return self._data['result']

    # @result.setter
    # def result(self, val: bool):
    #     self._data['result'] = val

    @property
    def json(self) -> jsonify:
        return jsonify(self._data)

    @property
    def dict(self) -> dict:
        return self._data

    def reset(self):
        self._data = self._default_data.copy()
