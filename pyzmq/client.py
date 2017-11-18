from datetime import datetime
import os
import sys
import time

import zmq


PORT = 2222
IP = "192.168.0.7"

# Configuring client.
context = zmq.Context()
socket = context.socket(zmq.REQ)
server_url = 'tcp://{}:{}'.format(IP, PORT) 
socket.connect(server_url)

# Sending data to server.
md = {"test-json1":"message embedded into json",
        "test-json2": " second message embedded into json"}
socket.send_json(md)

# Receiving answer from servers.
res = socket.recv_json()
if res["status"] == "Ok":
    print("Received data on server")
    print("Status: {}".format(res["status"]))
elif res["status"] == "Error":
    print("Error on receiving data at server")
else:
    print("Me no entender")

socket.close()
context.term()
