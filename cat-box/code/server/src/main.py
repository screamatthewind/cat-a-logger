import threading
from queue import Queue

import rest_api

q = Queue()

def threader():
    rest_api.start(q)


if __name__ == '__main__':

    t = threading.Thread(target=threader)
    t.daemon = True
    t.start()

    while True:
        motionEvent = q.get()
        print('motionEvent')
