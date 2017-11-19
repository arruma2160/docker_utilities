from datetime import datetime
import os
import sys
import time
import zmq

from configuration import Configuration

class Client:
    def __init__(self, ip, port):
        self._context = zmq.Context()
        self._socket = self._context.socket(zmq.REQ)
        self._serverIp = ip
        self._serverPort = port

    def connect(self):
        server_url = 'tcp://{}:{}'.format(self._serverIp, 
                                          self._serverPort) 
        self._socket.connect(server_url)

    def send_data(self, data):
        if not isinstance (data, dict):
            raise Exception("Data in non-dictionary format")
        self._socket.send_json(data)

    def recv_data(self):
        return self._socket.recv_json()

    def __del__(self):
        self._socket.close()
        self._context.term()

# Configuring client.
conf = Configuration()
client = Client(conf.ip, conf.port)
client.connect()

md = {
    "msg1":"message one",
    "msg2":"message two"
}
client.send_data(md)

res = client.recv_data()
if res["status"] == "Ok":
    print("Received data on server")
    print("Status: {}".format(res["status"]))
elif res["status"] == "Error":
    print("Error on receiving data at server")
else:
    print("Me no entender")

