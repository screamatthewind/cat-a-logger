import time
from multiprocessing.connection import Client

conn = Client(('localhost', 6000), authkey=b'secret password')
conn.send(['a', 2.5, None, int, sum])
time.sleep(1)
conn.send('close')
conn.close()

time.sleep(1)

# new client
conn = Client(('localhost', 6000), authkey=b'secret password')
conn.send(['a', 'b'])
conn.send('close_server')
conn.close()