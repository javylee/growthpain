#! /bin/sh

(time python test_exam.py) 1>/dev/null  2>result.txt
echo "\n****************************\n" >> result.txt
(time python from_begin_to_end.py) 1>/dev/null 2>>result.txt
