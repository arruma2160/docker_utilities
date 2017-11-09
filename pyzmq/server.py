import time 
import threading
import zmq
import json

def worker_routine(worker_url, context=None):
    """Worker routine

    """
    context = context or zmq.Context.instance()

    # Socket to talk to dispatcher
    socket = context.socket(zmq.REP)

    socket.connect(worker_url)

    error = None
    while True:
        try:
            data = socket.recv_json()
            print("Received data")
            for key, value in data.items():
                print("Received request: ['{}' : '{}']".format(key, value))
        except:
            Error = True

        if not error:
            response = {"status":"Ok"}
            socket.send_json(response)
        else:
            response = {"status":"Error"}
            socket.send_json(response)
            error = None


def main():
    """Server routine

    """
    url_worker = "inproc://workers"
    url_server = "tcp://0.0.0.0:2222"

    context = zmq.Context.instance()
    routers = context.socket(zmq.ROUTER)
    routers.bind(url_server)
    workers = context.socket(zmq.DEALER)
    workers.bind(url_worker)

    for i in range(5):
        thread = threading.Thread(target=worker_routine, 
                                  args=(url_worker,))
        thread.start()

    zmq.proxy(routers, workers)

    # We never get here but clean up anyhow
    routers.close()
    workers.close()
    context.term()

if __name__ == "__main__":
    main()
