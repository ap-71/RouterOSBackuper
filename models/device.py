from configure import db


class Device(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ip = db.Column(db.String(15), unique=True)
    name = db.Column(db.String(20))
    model = db.Column(db.String(20))
    vendor = db.Column(db.String(20))
    user = db.Column(db.String(50))
    img = db.Column(db.String(100))
    pub_key = db.Column(db.String(100))
    status = db.Column(db.Boolean, default=False)
    backup = db.relationship('Backup', backref='device', uselist=False)

    def __init__(self, **kwargs):
        self.ip = kwargs.pop('ip')
        self.name = kwargs.get('name', 'default')
        self.model = kwargs.get('model', 'RB_default')
        self.user = kwargs.get('user', 'admin')
        self.vendor = kwargs.get('vendor', 'MikroTik')
        self.pub_key = kwargs.get('pub_key')
        self.status = kwargs.get('status')
        self.img = kwargs.get('img', '/img/1100AHx4_dude.png')

    def __repr__(self):
        return {
            'id': self.id,
            # 'user': self.user,
            'img': self.img,
            'info': {
                'backup': self.backup.__repr__(),
                'status': self.status,
                'ip': self.ip,
                'name': self.name,
                'model': self.model,
                'vendor': self.vendor,
            }
        }


class Backup(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    device_id = db.Column(db.Integer(), db.ForeignKey('device.id'), )
    path_to_file = db.Column(db.String(100), default='')
    last_backup = db.Column(db.String(15), default='never')
    period_days_backup = db.Column(db.Integer(), default=7)

    def __init__(self, **kwargs):
        self.device_id = kwargs.pop('device_id')
        self.path_to_file = kwargs.pop('path_to_file')
        self.last_backup = kwargs.pop('last_backup')
        self.period_days_backup = kwargs.get('last_backup')

    def __repr__(self):
        return {
            'id': self.id,
            'device_id': self.device_id,
            'path_to_file': self.path_to_file,
            'last_backup': self.last_backup,
            'period_days_backup': self.period_days_backup,
        }


class DeviceDiscovery(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    ip = db.Column(db.String(15), unique=True)
    status = db.Column(db.Boolean, default=False)
    last_active = db.Column(db.String(15))

    def __init__(self, **kwargs):
        self.ip = kwargs.pop('ip')
        self.status = kwargs.pop('status')
        self.last_active = kwargs.pop('last_active')

    def __repr__(self):
        return {
            'id': self.id,
            'info': {
                'ip': self.ip,
                'status': self.status,
                'last_active': self.last_active,
            }
        }


db.create_all()
