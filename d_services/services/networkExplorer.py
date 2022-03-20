from icmplib import async_ping

from services.service import Service


class NetworkExplorer(Service):
    def __init__(self, **kwargs):
        config_default = (
            ('status', None),
            ('url', None),
            ('query', 'http://127.0.0.1:5000/api/discovery'),

        )
        for key, value in config_default:
            if kwargs.get(key) is None:
                kwargs[key] = value
        super().__init__(name='NetworkExplorer_' + kwargs.pop('name'), **kwargs)

    async def run(self) -> Service:
        result = await async_ping(self.configuration.host, count=5, interval=0.6)
        self.configuration.status = "online" if result.is_alive else "offline"
        # self.configuration.url = f'{self.configuration.query}?ip={self.configuration.host}&status={"online" if
        # result.is_alive else "offline"}'
        self.configuration.url = self.configuration.query
        return self
