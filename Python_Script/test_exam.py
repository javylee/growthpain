#! /bin/python
#__*__coding:utf-8

def printNValuesInList(inputList,n):
    listLength = len(inputList)
    m = n/listLength

    for i in range(m):
        for j in range(listLength):
	    print(inputList[j])

    for i in range(n-m*len(inputList)):
        print(inputList[i])



if __name__ == '__main__':
    
    lst = ['A','B','C','D']
    n = 150000
    printNValuesInList(lst,n)
