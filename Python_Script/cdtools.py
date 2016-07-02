# _*_ coding: utf-8 _*_
import os
import sys

def cdwalker(cdrom, cdcfile):
    
    export = []
    for root, dirs, files in os.walk(cdrom):
        export.append("\n%s %s %s" % (root,dirs,files))

    f = open(cdcfile, 'w')
    f.write(''.join(export))
    f.close()


if __name__ == '__main__':
    cdwalker(os.getcwd(),'mycd.txt')
