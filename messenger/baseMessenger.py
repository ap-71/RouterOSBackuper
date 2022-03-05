from abc import ABC, abstractmethod

from utils.configuration import Configuration


class Messenger(ABC):
    def __init__(self, **kwargs):

        if kwargs.get('ignore') is None:
            ignore: list = ['token']
        else:
            ignore: list = kwargs.pop('ignore')
        self.configuration = Configuration(ignore, **kwargs)
        self._configuration = Configuration(**kwargs)

    @abstractmethod
    def send(self, message):
        pass

    @abstractmethod
    def get(self):
        pass
