# https://tutorialedge.net/python/python-multiprocessing-tutorial/
import multiprocessing as mp


def my_func(x):
    print(mp.current_process())
    return x ** x


def main():
    pool = mp.Pool(mp.cpu_count())
    result = pool.map(my_func, [4, 2, 3, 5, 3, 2, 1, 2])
    result_set_2 = pool.map(my_func, [4, 6, 5, 4, 6, 3, 23, 4, 6])

    print(result)
    print(result_set_2)


if __name__ == "__main__":
    main()

