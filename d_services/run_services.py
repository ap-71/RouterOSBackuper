import asyncio
import time
from datetime import datetime

import requests
from loguru import logger
import os
from dotenv import load_dotenv
from configuration import SERVER_API

from services import service_fabric, services_run, EnumServices, make_manager


load_dotenv()



def run_services():
    # def get_devices_with_backup_none():
    #     try:
    #         result = requests.get('http://127.0.0.1:5000/api/get').json()
    #         return [device_['info']['ip'] for device_ in result['data'] if device_['info']['backup'] == 'None']
    #     except requests.exceptions.ConnectionError as error:
    #         logger.error(str(error))
    #         time.sleep(30)
    #         return get_devices_with_backup_none()

    def get_device_from_db():
        try:
            result = requests.get(f'http://{SERVER_API["IP"]}:{SERVER_API["PORT"]}/api/get').json()
            return [device_['info']['ip'] for device_ in result['data']]
        except requests.exceptions.ConnectionError as error_:
            logger.error(str(error_))
            time.sleep(30)
            return get_device_from_db()

    def device_from_backup():
        try:
            result = requests.get(f'http://{SERVER_API["IP"]}:{SERVER_API["PORT"]}/api/get').json()
            devices = []
            now_date = datetime.now()
            for device in result['data']:
                backup = device['info']['backup']
                backup = backup if backup != 'None' else None
                if backup is not None:
                    last_backup = (datetime.strptime(backup['last_backup'].split(' ')[0], '%Y-%m-%d') - now_date).days
                    if backup['period_days_backup'] > last_backup:
                        continue
                devices.append(device['info']['ip'])
            return devices
        except requests.exceptions.ConnectionError as error:
            logger.error(str(error))
            time.sleep(30)
            return device_from_backup()

    def gen_ip_range():
        devices_in_db = get_device_from_db()
        return [f'{os.environ.get("IP_RANGE")}{i}' for i in range(1, 255) if f'{os.environ.get("IP_RANGE")}{i}' not in devices_in_db]

    make_manager(name='device_in_db',
                 service=service_fabric(EnumServices.NetworkExplorer.value),
                 query=f'http://{SERVER_API["IP"]}:{SERVER_API["PORT"]}/api/update_device',
                 def_get_device=get_device_from_db)

    make_manager(name='device_discovery',
                 service=service_fabric(EnumServices.NetworkExplorer.value),
                 def_get_device=gen_ip_range)

    make_manager(name='device_backup',
                 service=service_fabric(EnumServices.Backupper.value),
                 def_get_device=device_from_backup,
                 sleep=60)

    # make_manager(name='device_with_backup_eq_none',
    #              service=service_fabric(EnumServices.Backupper.value),
    #              def_get_device=get_devices_with_backup_none,
    #              sleep=120)

    asyncio.run(services_run())


if __name__ == '__main__':
    run_services()
