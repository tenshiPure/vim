python <<EOM
import vim
import os
import os.path
import re

class Entry:

	fullPath = ''
	fullPathDQ = ''
	entryName = ''
	putDir = ''
	isDir = False
	extension = ''
	depth = 0
	pointed = False
	formatedForOutput = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, head, fullPath):
		self.fullPath = fullPath
		self.fullPathDQ = MyString.surround(fullPath, '"')
		self.entryName = self.getEntryName()
		self.putDir = self.getPutDir()
		self.isDir = self.getIsDir()
		self.extension = self.getExtension()
		self.depth = self.getDepth(head)
		self.pointed = False
		self.formatedForOutput = self.createFormatedForOutput()

	#
	# エントリ名を取得
	#
	def getEntryName(self):
		return self.fullPath.rsplit(os.sep, 1)[1]

	#
	# ファイルの置き場パスを取得
	#
	def getPutDir(self):
		return self.fullPath.replace(os.sep + self.entryName, '')

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
			return self.entryName.rsplit('.', 1)[1]

	#
	# 階層深度を取得
	#
	def getDepth(self, head):
		headDepth = head.count(os.sep)
		fullDepth = self.fullPath.count(os.sep)
		return fullDepth - headDepth

	#
	# 出力フォーマット
	#
	def createFormatedForOutput(self):
		point = '*' if self.pointed else ''
		tab = '\t' * self.depth

		return point + tab + self.entryName

	#
	# ポイントをオンにして出力内容を再作成する
	#
	def pointOn(self):
		self.pointed = True
		self.formatedForOutput = self.createFormatedForOutput()

	#
	# ポイントをオフにして出力内容を再作成する
	#
	def pointOff(self):
		self.pointed = False
		self.formatedForOutput = self.createFormatedForOutput()

EOM
