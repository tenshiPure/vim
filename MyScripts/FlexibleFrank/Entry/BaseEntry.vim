python <<EOM
import vim
import os
import os.path
import re
from abc import ABCMeta, abstractmethod

class BaseEntry:

	__metaclass__ = ABCMeta

	#
	# コンストラクタ
	#
	def __init__(self, head, fullPath):
		self.fullPath = fullPath
		self.entryName = self.getEntryName()
		self.putDir = self.getPutDir()
		self.depth = self.getDepth(head)
		self.pointed = False
		self.isDir = File.isDir(self.fullPath)
		self.extension = File.getExtension(self.entryName)
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
	# 階層深度を取得
	#
	def getDepth(self, head):
		headDepth = head.count(os.sep)
		fullDepth = self.fullPath.count(os.sep)
		return fullDepth - headDepth

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

	#
	# 出力フォーマット
	#
	@abstractmethod
	def createFormatedForOutput(self):
		pass

EOM
