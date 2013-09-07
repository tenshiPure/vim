# -*- coding:utf-8 -*-
import os
import re

import Directory
from Parts.Point import Point

class Entry:

	nextId = None
	rootPath = None

	#
	# 初期化
	#
	@staticmethod
	def initialize(rootPath):
		Entry.nextId = 0
		Entry.rootPath = os.path.abspath(os.path.dirname(rootPath))
		Point.initialize()

	#
	# コンストラクタ
	#
	def __init__(self, type, fullPath):
		self.id = self.getNextId()
		self.type = type
		self.fullPath = fullPath
		self.depth = self.getDepth()
		self.entryName = self.getEntryName()
		self.point = Point()
		self.extention = self.getExtention()
		self.formatedForOutput = self.getFormatedForOutput()

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
		mark = '*' if self.point.isOn() else ''
		tab = '.' * self.depth
		space = '_' if self.isDirectory() else ''
		return mark + tab + self.entryName + space

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
	# ファイル名が条件に一致すれば真を返す
	#
	def find(self, pattern):
		return re.search(pattern, self.entryName)


	#
	# ファイルを開き条件に一致した行と行番号をタプルリストで返す
	#
	def grep(self, fileName, pattern):
		if self.isDirectory():
			return []

		if not self.find(fileName):
			return []

		tuples = []
		with open(self.fullPath) as file:
			for lineNum, line in enumerate(file):
				if re.search(pattern, line):
					tuples.append((lineNum + 1, line.rstrip('\r\n')))

		return tuples

	#
	# ポイント切り替え
	#
	def pointsSwitch(self, idRange, findPattern = ''):
		for entry in self.loop(lambda entry: entry.id in idRange and entry.find(findPattern)):
			entry.point.switch()

	#
	# 範囲選択のリストを作成
	#
	def range(self, start, end):
		# 数字のみ、もしくは ^ か . のみ許可
		if re.search(r'(^[0-9]+$|^[\^\.]$)', start):
			if start == '^':
				start = self.id
			elif start == '.':
				pass
		
		# 数字のみ、もしくは $ か . のみ許可
		if re.search(r'(^[0-9]+$|^[\$\.]$)', end):
			if end == '$':
				for entry in self.loop():
					end = entry.id
			elif start == '.':
				pass

		return range(int(start), int(end) + 1)
