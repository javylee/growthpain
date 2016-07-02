# _*_ coding: utf-8 _*_

import sys

fin = open('cdays-4-test.txt', 'r')
fout = open('my-cdays4test-result.txt', 'w')

output = []
for line in fin:
    if line[0] == '#' or '' == line.strip():
        continue

    output.append(line)


fout.write(''.join(output))

fin.close()
fout.close()
