#__*__ coding: utf-8 __*__

"""Framework for getting filetypes-specific metadata.

Instantiate appropriate class with filename. Returned object acts like a 
dictionary, with key-value pairs for each piece of metadata.
	import fileinfo
	info = fileinfo.MP3Fileinfo("/music/ap/mahadeva.mp3")
	print("\\n".join(["%s=%s" % (k,v) for k,v in info.items()]))

Or use listDirectory function to get info on all files in a directory.
	for info in fileinfo.listDirectory("/music/ap/",[".mp3"]):
	.....

Framework can be extended by adding classes for particular file types, eg.
HTMLFileInfo, MPGFileInfo, DOCFileInfo.
Each class is completely responsible for 
parsing its files appropriately; see MP3FileInfo for example.
"""

import os
import sys
from collections import UserDict

def stripnulls(data):
	"strip witespace and nulls"
	return data.replace("\\x00","").strip()


class FileInfo(UserDict):
	"Store file metadata"
	def __init__(self, filename=None):
		UserDict.__init__(self)
		self["name"] = filename
	    

class MP3FileInfo(FileInfo):
	"Store ID3v1.0 MP3 tags"
	tagDataMap = {"title":(3,33,stripnulls),
		"artist":(33,63,stripnulls),
		"album":(63,93,stripnulls),
		"year":(93,97,stripnulls),
		"comment":(97,126,stripnulls),
		"genre":(127,128,stripnulls)}	

	def __parse(self,filename):
		"parse ID3v1.0 tags from MP3 file"
		self.clear()
		try:
			fsock = open(filename,"rb",0)
			try:
				fsock.seek(-128,2)
				tagdata = fsock.read(128)
				print(tagdata)
				print(tagdata[:3])
				print()
			finally:
				fsock.close()
			if tagdata[:3] == b'TAG':
				for tag, (start,end,parseFunc) in self.tagDataMap.items():
					self[tag] = parseFunc(str(tagdata[start:end]))
					print("===============>>"+self[tag])
		except IOError:
			pass
	
	def __setitem__(self,key,item):
		if key == "name" and item:
			self.__parse(item)
		FileInfo.__setitem__(self,key,item)

def listDirectory(directory,fileExtList):
	"get list of file info objects for files of particular extensions"
	fileList = [os.path.normcase(f)
		for f in os.listdir(directory)]
	fileList = [os.path.join(directory,f)
		for f in fileList
		if os.path.splitext(f)[1] in fileExtList]
	def getFileInfoClass(filename,module=sys.modules[FileInfo.__module__]):
		"get file info class from filename extension"
		subclass = "%sFileInfo" % os.path.splitext(filename)[1].upper()[1:]
		return hasattr(module, subclass) and getattr(module, subclass) or FileInfo
	return [getFileInfoClass(f)(f) for f in fileList]


if __name__ == '__main__':
	for info in listDirectory("I:\KuGou\\", [".mp3"]):
		print("\n".join(["%s=%s" % (k,v) for k,v in info.items()]))
		print()

		
