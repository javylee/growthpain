# _*_ coding: utf-8 _*_
import os

f = open(os.getcwd()+'\\mycd.txt', 'w')

export = []
for root, dirs, files in os.walk(os.getcwd()):
      #f.write("%s %s %s" % (root,dirs,files))
      export.append("\n%s %s %s" % (root,dirs,files))

f.write(''.join(export))
f.close()
