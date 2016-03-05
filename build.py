#!/usr/bin/env python3


class Builder:

    def __init__(self):
        print('in __init__')

    def prepDirectory(self):
        pass

    def build(self):
        pass

    def sayHello(self):
        print('hello')


if __name__ == '__main__':
    builder = Builder()
    builder.sayHello()
