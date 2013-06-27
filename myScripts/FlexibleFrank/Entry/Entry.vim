python <<EOM
import vim
import os
import os.path
import re

class Entry(EntryBase):

	isDir = False
	extension = ''
	formatedForOutput = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, head, fullPath):
		self.fullPath = fullPath
		self.fullPathDQ = MyString.surround(fullPath, '"')
		self.entryName = EntryBase.getEntryName(self)
		self.putDir = EntryBase.getPutDir(self)
		self.depth = EntryBase.getDepth(self, head)
		self.pointed = False
		self.isDir = MyFile.isDir(self.fullPath)
		self.extension = MyFile.getExtension(self.entryName)
		self.formatedForOutput = self.createFormatedForOutput()

	#
	# 出力フォーマット
	#
	def createFormatedForOutput(self):
		point = '*' if self.pointed else ''
		tab = '\t' * self.depth
		space = ' ' if self.isDir else ''

		return point + tab + self.entryName + space

EOM
