python <<EOM
import sys
import vim
import os
from abc import ABCMeta, abstractmethod

class BaseManager:

	#
	# コンストラクタ
	#
	def __init__(self, targetDir, myBufName):
		self.myBufName = myBufName
		self.targetDir = targetDir
		self.entries = []
		self.linedEntries = {}
		self.getEntries(self.targetDir, self.targetDir)

	#
	# エントリを生成する
	#
	@abstractmethod
	def getEntries(self, head, dirPath):
		pass

	#
	# ヘッダとエントリを出力する
	#
	def outputFrank(self):
		Tab.switchTab(self.myBufName, 3)

		self.outputHeader()
		self.outputEntries()

	#
	# エントリ前のヘッダ部等を出力
	#
	@abstractmethod
	def outputHeader(self):
		pass

	#
	# エントリを出力
	#
	def outputEntries(self):
		buf = vim.current.buffer

		line = len(buf) + 1
		for entry in self.entries:
			buf.append(entry.formatedForOutput)
			self.linedEntries[line] = entry
			line += 1

	#
	# ポイントをオンにする
	#
	def pointOn(self, firstLine, lastLine):
		pos = Cursor.getPos()

		for index in range(firstLine, lastLine + 1):
			self.linedEntries[index].pointOn()

		self.outputFrank()

		Cursor.setPos(pos)

	#
	# ポイントをオフにする
	#
	def pointOff(self, firstLine, lastLine):
		pos = Cursor.getPos()

		for index in range(firstLine, lastLine + 1):
			self.linedEntries[index].pointOff()

		self.outputFrank()

		Cursor.setPos(pos)

	#
	# 更新
	#
	def reloadFrank(self):
		self.entries = []
		self.linedEntries = {}
		self.getEntries(self.targetDir, self.targetDir)
		self.outputFrank()
		
EOM
