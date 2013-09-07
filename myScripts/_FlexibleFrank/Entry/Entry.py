# -*- coding:utf-8 -*-
import os
import re

import Directory
from Parts.Id import Id
from Parts.Type import Type
from Parts.Extension import Extension 
from Parts.Depth import Depth 
from Parts.Point import Point

class Entry:

	rootPath = None

	#
	# 初期化
	#
	@staticmethod
	def initialize(rootPath):
		Entry.rootPath = os.path.abspath(os.path.dirname(rootPath))
		Id.initialize()
		Point.initialize()

	#
	# コンストラクタ
	#
	def __init__(self, type, fullPath):
		self.id = Id()
		self.type = Type(type)
		self.fullPath = fullPath
		self.depth = Depth(Entry.rootPath, fullPath)
		self.entryName = self.getEntryName()
		self.point = Point()
		self.extension = Extension(fullPath)
		self.formatedForOutput = self.getFormatedForOutput()

	#
	# エントリ名
	#
	def getEntryName(self):
		return self.fullPath.rsplit(os.sep, 1)[1]

	#
	# 出力用文字列
	#
	def getFormatedForOutput(self):
		# point, depth, type
		mark = '*' if self.point.isOn() else ''
		tab = '.' * self.depth.value
		space = '_' if self.type.isDirectory() else ''
		return mark + tab + self.entryName + space

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

		if entry.type.isDirectory():
			for subDirectory in entry:
				for subEntry in self.generator(subDirectory):
					yield subEntry 

	#
	# ファイル名が条件に一致すれば真を返す
	#
	def find(self, pattern):
		return re.search(pattern, self.entryName)


	#
	# ファイルを開き条件に一致した行と行番号をタプルリストで返す
	#
	def grep(self, fileName, pattern):
		if self.type.isDirectory():
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
	def pointsSwitch(self, range, findPattern = ''):
		for entry in self.loop(lambda entry: range.inRange(entry.id) and entry.find(findPattern)):
			entry.point.switch()
