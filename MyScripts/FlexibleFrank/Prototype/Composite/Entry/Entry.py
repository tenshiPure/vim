# -*- coding:utf-8 -*-

class Entry:

	def __init__(self, fullPath, type):
		self.fullPath = fullPath
		self.type = type

	def isFile(self):
		return self.type == 'file'

	def isDirectory(self):
		return self.type == 'dir'

	def dump(self):
		print self.fullPath

		if self.isDirectory():
			for entry in self.entries:
				entry.dump()
