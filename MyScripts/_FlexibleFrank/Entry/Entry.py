# -*- coding:utf-8 -*-
import os
import re

import Directory
from Parts.Id import Id
from Parts.Type import Type
from Parts.Extension import Extension
from Parts.Depth import Depth
from Parts.Path import Path
from Parts.Name import Name
from Parts.Point import Point
from Parts.Output import Output

from Parts.GrepResult import GrepResult

class Entry:

	ROOT_PATH = None
	FILTER_FUNCTION = None

	#
	# 初期化
	#
	@staticmethod
	def initialize(rootPath):
		Entry.ROOT_PATH = os.path.abspath(os.path.dirname(rootPath))
		Id.initialize()
		Point.initialize()

	#
	# コンストラクタ
	#
	def __init__(self, type, fullPath):
		self.id = Id()
		self.type = Type(type)
		self.path = Path(fullPath)
		self.depth = Depth(Entry.ROOT_PATH, fullPath)
		self.name = Name(fullPath)
		self.point = Point()
		self.extension = Extension(fullPath)
		self.output = Output(self.point, self.depth, self.name, self.type)

	#
	# ループ
	#
	def loop(self, filterFunction = lambda entry: True):
		Entry.FILTER_FUNCTION = filterFunction
		return self.generator(self)

	#
	# ジェネレータ
	#
	def generator(self, entry):
		if Entry.FILTER_FUNCTION(entry):
			yield entry

		if entry.type.isDirectory():
			for subDirectory in entry:
				for subEntry in self.generator(subDirectory):
					yield subEntry 

	#
	# ファイルを開き条件に一致した行と行番号をタプルリストで返す
	# こりゃあコマンドか
	#
	def grep(self, fileName, pattern):
		grepResult = GrepResult()

		if self.type.isDirectory():
			return grepResult

		if not self.name.find(fileName):
			return grepResult

		with open(self.path.value) as file:
			for lineNum, line in enumerate(file):
				if re.search(pattern, line):
					grepResult.add(lineNum, line)

		return grepResult

	#
	# ポイント切り替え
	# これもコマンドか
	#
	def pointsSwitch(self, range, findPattern = ''):
		for entry in self.loop(lambda entry: range.inRange(entry.id) and entry.name.find(findPattern)):
			entry.point.switch()
			entry.output = Output(entry.point, entry.depth, entry.name, entry.type)

	#
	# 文字列出力
	#
	def __str__(self):
		print self.id
		print self.type
		print self.path
		print self.name
		print self.depth
		print self.extension
		print self.point
		print self.output
		return ''
