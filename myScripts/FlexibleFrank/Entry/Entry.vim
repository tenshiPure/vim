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
		EntryBase.__init__(self, head, fullPath)
		self.isDir = self.getIsDir()
		self.extension = self.getExtension()
		self.formatedForOutput = self.createFormatedForOutput()

	#
	# ディレクトリかどうかを判定
	#
	def getIsDir(self):
		return os.path.isdir(self.fullPath)

	#
	# 拡張子を取得
	#
	def getExtension(self):
		if self.isDir:
			return ''
		else:
			try:
				return self.entryName.rsplit('.', 1)[1]
			except IndexError:
				return ''

	#
	# 出力フォーマット
	#
	def createFormatedForOutput(self):
		point = '*' if self.pointed else ''
		tab = '\t' * self.depth
		space = ' ' if self.isDir else ''

		return point + tab + self.entryName + space

EOM
