python <<EOM
import vim
import os
import os.path
import re

class Entry:

	fullPath = ''
	entryName = ''
	underCurrentDepth = ''
	putDir = ''
	isDir = False
	depth = 0
	pointed = False
	formatedForOutput = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, fullPath):
		self.fullPath = fullPath
		self.entryName = self.getEntryName()
		self.underCurrentDepth = self.getUnderCurrentDepth()
		self.putDir = self.getPutDir()
		self.isDir = self.getIsDir()
		self.depth = self.getDepth()
		self.pointed = False
		self.formatedForOutput = self.createFormatedForOutput()

	#
	# エントリ名を取得
	#
	def getEntryName(self):
		return self.fullPath.rsplit(os.sep, 1)[1]

	#
	# カレント階層以下部のパスを取得
	#
	def getUnderCurrentDepth(self):
		cwd = os.getcwd()
		return self.fullPath.replace(cwd + os.sep, '')

	#
	# ファイルの置き場パスを取得
	#
	def getPutDir(self):
		return self.fullPath.replace('\\' + self.entryName, '')

	#
	# ディレクトリかどうかを判定
	#
	def getIsDir(self):
		return os.path.isdir(self.fullPath)

	#
	# 階層深度を取得
	#
	def getDepth(self):
		cwd = os.getcwd()
		cwdDepth = cwd.count(os.sep)
		fullDepth = self.fullPath.count(os.sep)
		return fullDepth - cwdDepth

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
