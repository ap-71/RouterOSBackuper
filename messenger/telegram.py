import requests


from dotenv import load_dotenv
import os

from messenger.baseMessenger import Messenger


class Telegram(Messenger):
    def __init__(self):
        load_dotenv()
        super().__init__(ignore=['token', 'chat_id'],
                         token=os.environ.get('TELEGRAM_TOKEN'),
                         chat_id=os.environ.get('TELEGRAM_CHAT_ID')
                         )

    def send(self, message):
        url = f"https://api.telegram.org/{self._configuration.token}/sendMessage?chat_id={self._configuration.chat_id}&text={message}"
        return requests.get(url)

    def get(self):
        pass


if __name__ == '__main__':
    telega = Telegram()
    print(telega.send('Тестовое сообщение'))
