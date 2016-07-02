#__*__ coding:utf-8 __*__


def openFile(filename):
	
	try:
		fsock = open(str(filename))
		try:
			line = fsock.readline
		except Exception as e:
			print("Exceptions: {0} {1}".format(e.errno,e.strerror))
		finally:
			fsock.close()
	except IOError as ioe:
		print("Exceptions: {0} {1}".format(ioe.errno,ioe.strerror))
	else:
		print("File exists and opened.")
    

def withHandleFile(filename):
	try:
		with open(filename,'r') as fin:
			for line in fin:
				print(line)
	except IOError as e:
		print("Exceptions: {0} - {1}".format(e.errno,e.strerror))


if __name__ == "__main__":
	openFile("test.py")
	withHandleFile("test.py")