import os
import re
from datetime import datetime

from flask import send_file
from loguru import logger

from configure import db
from messenger import Telegram
from models.device import Device, DeviceDiscovery, Backup

__ALL__ = ['actions']

from utils.jsonSkeleton import JSONSkeleton


def to_json(data=None):
    json_skeleton = JSONSkeleton()
    if isinstance(data, dict):
        json_skeleton.data = data
    else:
        if data is not None:
            for data_ in data:
                json_skeleton.data = data_.__repr__()
    return json_skeleton.json


def create_device(**kwargs):
    id_ = kwargs.get('id')
    if id_ is not None and id_ != -1:
        try:
            device_ = DeviceDiscovery.query.get(id_)
            device_new = Device(ip=device_.ip, status=device_.status)
            db.session.delete(device_)
            db.session.add(device_new)
        except Exception as error:
            logger.error(str(error))
            db.session.rollback()
        else:
            db.session.commit()
            return to_json((device_,))
    else:
        device_ = Device(**kwargs)
        db.session.add(device_)
        db.session.commit()
        return to_json((device_,))
    return to_json()


def update_device(**kwargs):
    method = kwargs.pop('method')
    devices_ = []
    for key, status_ in kwargs.copy().items():
        device_ = Device.query.filter(Device.ip == key).all()
        status = kwargs['status'] = True if status_ == 'online' else False
        last_active = datetime.now().__str__()
        if len(device_) != 0:
            device__ = device_[0]
            if status:
                device__.last_active = last_active
            if device__.status != status:
                Telegram().send(device__.ip + ' is ' + ('UP' if status else 'DOWN'))
                device__.status = status
            devices_.append(device__)
    if len(devices_) != 0:
        db.session.commit()
        return to_json(devices_)
    return to_json()


def discovery_device(**kwargs):
    devices = DeviceDiscovery.query.all()
    devices_in_db = Device.query.all()
    last_active = datetime.now().__str__()

    devices_ = []
    for dev_in_db in devices_in_db:
        if dev_in_db.ip in kwargs.keys():
            del kwargs[dev_in_db.ip]

    for device_ in devices:
        if device_.ip in kwargs.keys():
            status = kwargs.pop(device_.ip)
            if True if status == 'online' else False:
                device_.last_active = last_active
            device_.status = True if status == 'online' else False
            devices_.append(device_)

    for ip, status in kwargs.items():
        if re.match(r'[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+', ip) is None:
            continue
        _kwargs = {
            'last_active': last_active,
            'ip': ip,
            'status': True if status == 'online' else False
        }
        if DeviceDiscovery.query.get(ip) is None:
            device_ = DeviceDiscovery(**_kwargs)
            db.session.add(device_)
            devices_.append(device_)
    db.session.commit()
    return to_json(devices_)


def get_discovery_device(filter_=None, **kwargs):
    if filter_ is None:
        devices = DeviceDiscovery.query.all()
    else:
        devices = DeviceDiscovery.query.filter(getattr(DeviceDiscovery, filter_) == kwargs.get(filter_))
    return to_json(devices)


# def update_discovery_device(**kwargs):
#     devices = DeviceDiscovery.query.filter(DeviceDiscovery.ip == kwargs.get('ip', '127.0.0.1')).all()
#     status = kwargs.get('status')
#     last_active = datetime.now().__str__()
#     if len(devices) != 0:
#         device_ = devices[0]
#         if status:
#             device_.last_active = last_active
#         device_.status = status
#         db.session.commit()


def get_device(filter_=None, **kwargs):
    if filter_ is None:
        devices = Device.query.all()
    else:
        devices = Device.query.filter(getattr(Device, filter_) == kwargs.get(filter_))
    return to_json(devices)


def put_backup(**kwargs):
    devices = Device.query.all()
    current_datetime = datetime.now().__str__()

    devices_ = []
    for device_ in devices:
        if device_.ip in kwargs.keys():
            path = kwargs.pop(device_.ip)
            if device_.backup is None:
                device_.backup = Backup(
                    device_id=device_.id,
                    path_to_file=path,
                    last_backup=current_datetime
                )
            else:
                device_.backup.path_to_file = path
                device_.backup.last_backup = current_datetime
            devices_.append(device_)
    db.session.commit()
    return to_json(devices_)


def get_file(**kwargs):
    path = kwargs.get('path')
    folder_name = kwargs.get('folder_name', 'backups')
    if kwargs['method'] == 'POST' and path is not None:
        try:
            return send_file(os.path.join('files', folder_name, path))
        except FileNotFoundError as error_fnfe:
            logger.error(str(error_fnfe))
    return to_json()


def delete_device(**kwargs):
    id_ = kwargs.pop('id')
    try:
        device_ = DeviceDiscovery.query.get(id_)
        db.session.delete(device_)
    except Exception as error:
        logger.error(str(error))
        db.session.rollback()
    else:
        db.session.commit()
        return to_json({'device': id_, 'action': 'delete'})
    return to_json()


actions = {
    'add': create_device,
    'get': get_device,
    'delete': delete_device,
    'update_device': update_device,
    'discovery': discovery_device,
    'get_discovery': get_discovery_device,
    'put_backup': put_backup,
    'get_file': get_file
    # 'update_discovery': update_discovery_device,
}
