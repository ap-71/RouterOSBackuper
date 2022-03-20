import asyncio
from enum import Enum
from typing import List

from services.backupper import Backupper
from services.networkExplorer import NetworkExplorer
from services.serviceManager import ServiceManager

__all__ = ['service_fabric', 'services_run', 'EnumServices', 'make_manager']

serviceManagers: List[ServiceManager] = []


class EnumServices(Enum):
    Backupper = 'backupper'
    NetworkExplorer = 'network_explorer'


def make_manager(def_get_device, service, sleep=60, query=None, name='Default'):
    service_manager = ServiceManager(sleep=sleep, def_get_device=def_get_device, query=query, name=name)
    service_manager.add_service(service)
    serviceManagers.append(service_manager)
    return service_manager


def service_fabric(name_service):
    service = None
    if name_service == 'backupper':
        service = Backupper
    elif name_service == 'network_explorer':
        service = NetworkExplorer

    return service


async def services_run():
    await asyncio.gather(*(manager.run() for manager in serviceManagers))
