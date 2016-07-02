#! /bin/python
#__*__coding:utf-8

def printNValuesInList(inputList,n):

    j = 0
    for i in range(1,n+1):
        print(lst[j])
	j += 1
	if i% 4 == 0:
	    j = 0


if __name__ == '__main__':
    
    lst = ['A','B','C','D']
    n = 150000
    printNValuesInList(lst,n)
