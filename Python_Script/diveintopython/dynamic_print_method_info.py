#__*__ coding:utf-8 __*__
#info 函数的设计意图是提供给工作在 Python IDE 中的开发人员使用，它可以接
#受任何含有函数或者方法的对象 (比如模块，含有函数，又比如 list，含有方
#法) 作为参数，并打印出对象的所有函数和它们的  doc string 。

import os
import string

def info(object,spacing=10,collapse=1):
	"""Print methods and doc strings.

	Takes module, class, list, dictionary, or string."""
	methodlist = [method for method in dir(object) if callable(getattr(object,method))]
	processFunc = collapse and (lambda s:" ".join(s.split())) or (lambda s: s)
	print("\n".join(["%s %s" %
		(method.ljust(spacing),
		processFunc(str(getattr(object,method).__doc__)))
		for method in methodlist]))
	


if __name__ == '__main__':
	#print(info.__doc__)
	#print(info(list))
	#print(info(list,16,0))
	print(os.getcwd())