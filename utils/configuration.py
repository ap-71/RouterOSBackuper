from utils.jsonSkeleton import JSONSkeleton


class Configuration:
    def __init__(self, ignore: list or None = None, **kwargs):
        self._keys = []
        for k, v in kwargs.items():
            if k not in (ignore if ignore is not None else []):
                self._keys.append(k)
                self.__setattr__(k, v)
        for k in self._keys:
            del kwargs[k]

    def add(self, key, value):
        self.__setattr__(key, value)

    def getattribute(self):
        data = {}
        for k in self._keys:
            data[k] = self.__getattribute__(k)
        return data
