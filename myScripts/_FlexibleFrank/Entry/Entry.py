# -*- coding:utf-8 -*-
import os

import Directory

class Entry:

	nextId = 0
	rootPath = ''

	#
	# 実行ディレクトリをセットする
	#
	@staticmethod
	def setRootPath(rootPath):
		Entry.rootPath = os.path.abspath(os.path.dirname(rootPath))

	#
	# コンストラクタ
	#
	def __init__(self, type, fullPath):
		self.id = self.getNextId()
		self.type = type
		self.fullPath = fullPath
		self.depth = self.getDepth()
		self.entryName = self.getEntryName()
		self.pointed = False
		self.formatedForOutput = self.getFormatedForOutput()
		self.extention = self.getExtention()

	#
	# IDの自動連番
	#
	def getNextId(self):
		Entry.nextId += 1
		return Entry.nextId

	#
	# 実行ディレクトリからの深度
	#
	def getDepth(self):
		rootDepth = Entry.rootPath.count(os.sep)
		currentDepth = self.fullPath.count(os.sep)
		return currentDepth - rootDepth - 1

	#
	# エントリ名
	#
	def getEntryName(self):
		return self.fullPath.rsplit(os.sep, 1)[1]

	#
	# 出力用文字列
	#
	def getFormatedForOutput(self):
		point = '*' if self.pointed else ''
		tab = '.' * self.depth
		space = ' ' if self.isDirectory() else ''
		return point + tab + self.entryName + space

	#
	# 拡張子
	#
	def getExtention(self):
		if self.isDirectory():
			return None

		try:
			return self.entryName.rsplit('.', 1)[1]
		except:
			return ''

	#
	# 再帰ループ時のフィルタメソッド
	#
	filterFunction = None

	#
	# ループ
	#
	def loop(self, filterFunction = lambda entry: True):
		Entry.filterFunction = filterFunction
		return self.generator(self)

	#
	# ジェネレータ
	#
	def generator(self, entry):
		if Entry.filterFunction(entry):
			yield entry

		if entry.isDirectory():
			for subDirectory in entry:
				for subEntry in self.generator(subDirectory):
					yield subEntry 

	#
	# ファイルか判定
	#
	def isFile(self):
		return self.type == 'file'

	#
	# ディレクトリか判定
	#
	def isDirectory(self):
		return self.type == 'dir'

	#
	# 開発補助
	#
	def dump(self, fields = ['id', 'type', 'fullPath', 'depth', 'entryName', 'pointed', 'formatedForOutput', 'extention']):
		for entry in self.loop():
			for field in fields:
				print '%-20s : %s' % (field, eval('entry.%s' % field))
			print ' '
