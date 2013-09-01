# -*- coding:utf-8 -*-
import os

class Entry:

	nextId = 0
	rootPath = ''

	@staticmethod
	def setRootPath(rootPath):
		Entry.rootPath = os.path.abspath(os.path.dirname(rootPath))

	def __init__(self, type, fullPath):
		self.id = self.getNextId()
		self.type = type
		self.fullPath = fullPath
		self.depth = self.getDepth()
		self.underRootPath = self.getUnderRootPath()
		self.entryName = self.getEntryName()
		self.pointed = False
		self.formatedForOutput = self.getFormatedForOutput()
		self.extention = self.getExtention()

	def getNextId(self):
		Entry.nextId += 1
		return Entry.nextId

	def getDepth(self):
		rootDepth = Entry.rootPath.count(os.sep)
		currentDepth = self.fullPath.count(os.sep)
		return currentDepth - rootDepth - 1

	def getUnderRootPath(self):
		return self.fullPath.replace(Entry.rootPath + os.sep, '')

	def getEntryName(self):
		return self.fullPath.rsplit(os.sep, 1)[1]

	def getFormatedForOutput(self):
		point = '*' if self.pointed else ''
		tab = '\t' * self.depth
		space = ' ' if self.isDirectory() else ''
		return point + tab + self.entryName + space

	def getExtention(self):
		if self.isDirectory():
			return None
		try:
			return self.entryName.rsplit('.', 1)[1]
		except:
			return ''

	def getById(self, id):
		if id == self.id:
			return self

		if self.isDirectory():
			for entry in self.entries:
				result = entry.getById(id)
				if result is not None:
					return result

		else:
			return None

	def isFile(self):
		return self.type == 'file'

	def isDirectory(self):
		return self.type == 'dir'

	def dump(self):
		print '%-20s : %d' % ('id', self.id)
		print '%-20s : %s' % ('type', self.type)
		print '%-20s : %s' % ('depth', self.depth)
		print '%-20s : %s' % ('underRootPath ?', self.underRootPath)
		print '%-20s : %s' % ('fullPath', self.fullPath)
		print '%-20s : %s' % ('entryName', self.entryName)
		print '%-20s : %s' % ('extention', self.extention)
		print '%-20s : %s' % ('formatedForOutput', self.formatedForOutput)
		print ' '

		if self.isDirectory():
			for entry in self.entries:
				entry.dump()
