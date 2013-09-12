# -*- coding:utf-8 -*-
import os
import os.path

from Entry import Entry
from File import File
from Parts.Type import Type

class Directory(Entry):

	#
	# コンストラクタ
	#
	def __init__(self, fullPath, recursive = True):
		Entry.__init__(self, Type.DIRECTORY, fullPath)
		if recursive:
			self.entries = self.getEntries(fullPath)
		else:
			self.entries = []

	#
	# 再帰的にエントリを作成
	#
	def getEntries(self, path):
		entries = []
		for entryName in os.listdir(path):
			fullPath = os.path.join(path, entryName)

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
