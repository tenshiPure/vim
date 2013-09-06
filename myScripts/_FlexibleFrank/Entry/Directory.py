# -*- coding:utf-8 -*-
import os
import os.path

from Entry import Entry
from File import File

class Directory(Entry):

	#
	# コンストラクタ
	#
	def __init__(self, fullPath, recursive = True):
		Entry.__init__(self, 'dir', fullPath)
		if recursive:
			self.entries = self.getEntries(fullPath)
		else:
			self.entries = []

	#
	# 再帰的にエントリを作成
	#
	def getEntries(self, currentRoot):
		entries = []
		for entryName in os.listdir(currentRoot):
			fullPath = os.path.join(currentRoot, entryName)

			if os.path.isfile(fullPath):
				entries.append(File(fullPath))

			if os.path.isdir(fullPath):
				entries.append(Directory(fullPath))

		return entries

	#
	# ジェネレータ用イテレータ
	#
	def __iter__(self):
		return iter(self.entries)
