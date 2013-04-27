python <<EOM
import vim
import os
import os.path
import re

class Entry:

	fullPath = ''
	entryName = ''
	underCurrentDepth = ''
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
		return '\t' * self.depth + self.entryName

EOM
