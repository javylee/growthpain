#!/usr/bin/env python
# __*__ coding:utf-8 __*__

def buildConnString(params):
    '''Build a connection string from a dictionary of parameters.

    Return strings.'''

    return ';'.join(['%s=%s' % (k,v) for k, v in params.items()])


if __name__ == "__main__":
    myParams = {"server":"mpilgrim",\
        "database":"master",\
        "uid":"sa",\
        "pwd":"secret"\
        }

    print(buildConnString(myParams))
    print(buildConnString(myParams))
    print(buildConnString.__doc__)
    print(buildConnString.__name__)
    print(dir(myParams))
 