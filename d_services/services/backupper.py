import asyncio
import os
from random import randint

import pysftp as pysftp
from asgiref.sync import sync_to_async
from dotenv import load_dotenv
from loguru import logger
from netmiko import ConnectHandler, NetmikoTimeoutException, NetmikoAuthenticationException

from messenger import Telegram
from run_services import SERVER_API
from services.service import Service


class Backupper(Service):
    def __init__(self, period=7, **kwargs):
        load_dotenv()
        self._period = period
        self._filename = 'backup.rsc'
        if kwargs.get('host') is None:
            raise KeyError('host=none, Необходимо указать IP или доменное имя')
        config_default = (
            ('ignore', ('username', 'password', 'device_type')),
            ('device_type', 'mikrotik_routeros'),
            ('password', os.environ.get('MT_PASSWORD')),
            ('username', os.environ.get('MT_USER')),
            ('url', None),
            ('path', None),
            ('query', f'http://{SERVER_API["IP"]}:{SERVER_API["PORT"]}/api/put_backup'),
        )
        for key, value in config_default:
            if kwargs.get(key) is None:
                kwargs[key] = value

        super().__init__(name='Backupper_' + kwargs.pop('name'), **kwargs)

    async def run(self, **kwargs) -> Service:

        await asyncio.wait([self._connect()])
        self.configuration.path = path = await self._get_file()
        self.configuration.url = self.configuration.query
        if path is not None:
            await self._send_msg_in_telegram()
        return self

    @sync_to_async
    def _connect(self):
        try:
            with ConnectHandler(host=self.configuration.host, **self._configuration) as ssh:
                ssh.send_config_set(['/export file=' + self._filename])
        except (NetmikoTimeoutException, NetmikoAuthenticationException) as error:
            logger.error(error)

    @sync_to_async
    def _get_file(self):
        try:
            path_root = os.path.join('files', 'backups')
            path_dir = self.configuration.host
            full_path = os.path.join(path_root, path_dir, self._filename)
            os.makedirs(os.path.join(path_root, path_dir), exist_ok=True)
            cnopts = pysftp.CnOpts()
            cnopts.hostkeys = None
            with pysftp.Connection(
                    self.configuration.host,
                    username=self._configuration['username'],
                    password=self._configuration['password'],
                    cnopts=cnopts
            ) as sftp:
                sftp.get('./' + self._filename, full_path)
        except Exception as error:
            logger.error(str(error))
            return None
        return os.path.join(path_dir, self._filename)

    @sync_to_async
    def _send_msg_in_telegram(self):
        telegram = Telegram()
        message = self.name + f':  {self.configuration.host} - ' \
                              f'{"OK" if self.configuration.path is not None else "Что-то пошло не так"} - ' \
                              f'Путь: {self.configuration.path}'
        return telegram.send(message)
