# https://tutorialedge.net/python/python-multiprocessing-tutorial/

import glob
import multiprocessing as mp

INPUT_FILES = "../input/dogs-vs-cats-redux-kernels-edition/train/cat.?????.jpg"


def my_func(filename):
    # print(filename)
    return filename


def main():
    pool = mp.Pool(mp.cpu_count())
    result = pool.map(my_func, glob.iglob(INPUT_FILES))

    print(result)


if __name__ == "__main__":
    main()
