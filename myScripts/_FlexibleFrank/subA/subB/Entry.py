# -*- coding:utf-8 -*-

class Entry:

	def __init__(self, fullPath, type):
		self.id = 1
		self.type = type
		self.fullPath = fullPath

	def isFile(self):
		return self.type == 'file'

	def isDirectory(self):
		return self.type == 'dir'

	def dump(self):
		print self.id
		print self.type
		print self.fullPath
		print ' '

		if self.isDirectory():
			for entry in self.entries:
				entry.dump()
