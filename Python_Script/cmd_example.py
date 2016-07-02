# __*__ coding:utf-8 __*__

import os
import sys
import cmd
from cdtools import *


class PyCDC(cmd.Cmd):
    def __init__(self):
        cmd.Cmd.__init__(self)    # Initialize the base class

    def help_EOF(self):
        print "Quits the program!"

    def do_EOF(self, line):
        sys.exit()

    def help_walk(self):
        print "Walk CD and export into *.cdc"

    def do_walk(self, filename):
        if filename == "":
	    filename = raw_input("Please input the cdc file name:: ")
	    print "The CD content will be saved into: '%s'" % filename

    def help_dir(self):
        print "Specify Save/Search directory"

    def do_dir(self, pathname):
        if pathname == "":
	    pathname = raw_input("Please specify the SAVE/SEARCH directory: ")

    def help_find(self):
        print "Specify the keyword"

    def do_find(self, keyword):
        if keyword == "":
	    raw_input("Please input the keyword: ")
	    print "The searching keyword is: '%s'" % keyword


if __name__ == '__main__':
    cdc = PyCDC()
    cdc.cmdloop()
    CDROM = os.getcwd()
    cdwalker(CDROM, 'mycd.txt')
