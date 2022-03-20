import asyncio
from pprint import pprint
from random import randint

import requests
from loguru import logger

from services.backupper import Backupper
from services.networkExplorer import NetworkExplorer
from utils.jsonSkeleton import JSONSkeleton


class ServiceManager:
    def __init__(self, **kwargs):
        # self._data = {}
        self.name = 'ServiceManager_' + kwargs.get('name', str(randint(1, 65550)))
        self.service = None
        self._configuration = kwargs
        self._get_device = kwargs.pop('def_get_device')

    def add_service(self, service):
        self.service = service

    async def run(self):
        while True:
            tasks = []
            _data = dict(url='', params=[])
            for device in self._get_device():
                tasks.append(self.service(host=device, **self._configuration).run())
            results = await asyncio.gather(*tasks)
            try:
                for device in results:
                    if isinstance(device, NetworkExplorer) or \
                            isinstance(device, Backupper) and device.configuration.path is not None:
                        device_conf = device.configuration.getattribute()
                        _data['url'] = device_conf.pop('url')
                        _data['params'].append([device_conf[k] for k in device_conf.keys() if k not in ['query', 'sleep']])
                requests.get(**_data)
            except (requests.exceptions.ConnectionError, requests.exceptions.MissingSchema) as error_ce:
                logger.error(str(error_ce))
                await asyncio.sleep(60)
                await self.run()
            await asyncio.sleep(self._configuration.get('sleep', 30))
