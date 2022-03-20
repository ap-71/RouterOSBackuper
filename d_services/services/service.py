from abc import ABC, abstractmethod

from utils.configuration import Configuration


class Service(ABC):
    def __init__(self, ignore=None, **kwargs) -> None:
        if ignore is None:
            ignore = []
        self.url = kwargs.get('url')
        if kwargs.get('name') is None:
            self.name = 'Default'
        else:
            self.name = kwargs.pop('name')
        self._configuration = {key: kwargs.pop(key) for key in ignore}
        self.configuration = Configuration(ignore=ignore, **kwargs)

    def configure(self, **kwargs):
        if len(self._configuration) != 0:
            self._configuration.update(kwargs)
        else:
            self._configuration = kwargs

    @abstractmethod
    async def run(self, **kwargs):
        pass
