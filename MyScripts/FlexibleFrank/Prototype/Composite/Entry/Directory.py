# -*- coding:utf-8 -*-
import os
import os.path

from Entry import Entry
from File import File

class Directory(Entry):

	def __init__(self, fullPath):
		Entry.__init__(self, fullPath, 'dir')
		self.entries = self.getEntries(fullPath)

	def getEntries(self, currentRoot):
		entries = []
		for entryName in os.listdir(currentRoot):
			fullPath = os.path.join(currentRoot, entryName)

			if os.path.isfile(fullPath):
				entries.append(File(fullPath))

			if os.path.isdir(fullPath):
				entries.append(Directory(fullPath))

		return entries
