# -*- coding:utf-8 -*-
import os
import re

import Directory

class Entry:

	nextId = None
	rootPath = None
	pointNum = None

	#
	# 初期化
	#
	@staticmethod
	def init(rootPath):
		Entry.nextId = 0
		Entry.rootPath = os.path.abspath(os.path.dirname(rootPath))
		Entry.pointNum = 0

	#
	# コンストラクタ
	#
	def __init__(self, type, fullPath):
		self.id = self.getNextId()
		self.type = type
		self.fullPath = fullPath
		self.depth = self.getDepth()
		self.entryName = self.getEntryName()
		self.point = 0
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
		isPointed = '*' if self.isPointOn() else ''
		tab = '.' * self.depth
		space = '_' if self.isDirectory() else ''
		return isPointed + tab + self.entryName + space

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
	# 開発補助：ダンプ
	#
	def dump(self, fields = ['id', 'type', 'fullPath', 'depth', 'entryName', 'point', 'extention', 'formatedForOutput']):
		for field in fields:
			if field == 'formatedForOutput':
				print '%-20s\n%s' % (field, eval('self.%s' % field))
			else:
				print '%-20s : %s' % (field, eval('self.%s' % field))
		print ' '

	#
	# 開発補助：再帰ダンプ
	#
	def dumpRec(self, fields = ['id', 'type', 'fullPath', 'depth', 'entryName', 'point', 'extention', 'formatedForOutput']):
		for entry in self.loop():
			entry.dump(fields)

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
	# ポイントオンか判定する
	#
	def isPointOn(self):
		return self.point != 0

	#
	# ポイントオフか判定する
	#
	def isPointOff(self):
		return self.point == 0

	#
	# ポイント切り替え
	#
	def pointToggle(self):
		if self.isPointOn():
			self.point = 0
		else:
			Entry.pointNum += 1
			self.point = Entry.pointNum

		self.formatedForOutput = self.getFormatedForOutput()

	#
	# 複数のポイントを切り替える
	#
	def pointsToggle(self, idRange, findPattern = ''):
		for entry in self.loop(lambda entry: entry.id in idRange and entry.find(findPattern)):
			entry.pointToggle()

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
