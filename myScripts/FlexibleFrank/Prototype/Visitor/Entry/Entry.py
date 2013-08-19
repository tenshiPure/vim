# -*- coding:utf-8 -*-

class Entry:
	def __init__(self, fullPath, type):
		self.fullPath = fullPath
		self.type = type

	def isFile(self):
		if self.type == 'file':
			return True

	def isDirectory(self):
		if self.type == 'dir':
			return True

	def accept(self, visitor):
		visitor.visit(self)
