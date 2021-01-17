# https://laconicwolf.com/2018/11/20/implementing-multithreading-and-multiprocessing-in-python3/

# multithreaded_multiprocessed.py

from multiprocessing import Pool, cpu_count
import threading
import time
from queue import Queue
import requests

urls = ["https://www.google.com", "https://www.bing.com", "https://yahoo.com"]
words = [
    "maps",
    "news",
    "videos",
    "foo",
    "bar",
    "admin",
    "test",
    ".htaccess",
    "search",
    "blah",
]

def make_request(url):
    """Makes a web request and prints the URL and response code."""
    resp = requests.get(url)
    print("Url: {}".format(url))
    print("Response code: {}\n".format(resp.status_code))


def manage_queue(url, dir_queue):
    """Manages the dir_queue and calls the make_request function"""
    while True:
        directory = dir_queue.get()
        resource = url.strip("/") + "/" + directory
        make_request(resource)
        dir_queue.task_done()


def do_multithreading(url):
    """Starts the multithreading"""

    # Set the number of threads.
    number_of_threads = 5

    # Initializes the queue.
    dir_queue = Queue()

    # Starts the multithreading
    for i in range(number_of_threads):
        t = threading.Thread(target=manage_queue, args=[url, dir_queue])
        t.daemon = True
        t.start()

    for directory in words:
        dir_queue.put(directory)
        
    dir_queue.join()


if __name__ == '__main__':
    start = time.time()

    # Creates a process pool with n processes, where
    # n is the number returned by cpu_count
    with Pool(cpu_count()) as p:

        # Spawns a process for each URL
        p.map(do_multithreading, urls)

    print("Execution time = {0:.5f}".format(time.time() - start))