# https://tutorialedge.net/python/python-multiprocessing-tutorial/
from multiprocessing import Process, Queue
import random


def rand_num():
    num = random.random()
    print(num)


if __name__ == "__main__":
    queue = Queue()

    processes = [Process(target=rand_num, args=()) for x in range(100)]

    for p in processes:
        p.start()

    for p in processes:
        p.join()