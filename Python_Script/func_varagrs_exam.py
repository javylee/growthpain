# _*_ coding: utf-8 _*_

def foo(pos1, pos2='abc', *args, **kwargs):
    print('pos arg 1: %s' % pos1)
    print('pos arg 2: %s' % pos2)
    for arg in args:
        print('extra arg: %s' % arg)
    for k, v in kwargs.items():
        print('extra arg: %s=%s' % (k, v))




foo(42, 'xyz', 'one more', bar='cheers')
foo('bar', num=3.142, bar='CA state')
