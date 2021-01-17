from multiprocessing.connection import Listener
listener = Listener(('localhost', 6000), authkey=b'secret password')
running = True
while running:
    conn = listener.accept()
    print('connection accepted from', listener.last_accepted)
    while True:
        msg = conn.recv()
        print(msg)
        if msg == 'close':
            conn.close()
            break
        if msg == 'close_server':
            conn.close()
            running = False
            break
listener.close()