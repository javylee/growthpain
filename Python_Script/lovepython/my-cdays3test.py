# _*_ coding:utf-8 _*_

import sys

DEFAULT-INDEX-FILE = "cdays-3-test.txt"
#fout = open('my-cdays3test-result.txt', 'w')


print sys.argv


def collection(key-index):
    return ley-index.count()

def search_key_index(index-file, keyword):
     
    fin = open(index-file, 'r')
    key-index = []
    for line in fin:
        format-line = line.strip().split()
	if format-line[1] == keyword:
	    key-index.append(format-line[0])


    fin.close()
    return key-index


#fout.close()
if len(sys.argv) > 1:
    options = sys.argv[1:]
    if '-k' in options
    if '-f' == sys.args[1]:
    input-index-file = sys.args[2]


