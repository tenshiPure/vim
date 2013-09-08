# -*- coding:utf-8 -*-

class GrepResult:

	LINE_NUM = 0
	LINE = 1

	#
	# コンストラクタ
	#
	def __init__(self):
		self.value = []

	#
	# 結果追加
	#
	def add(self, lineNum, line):
		self.value.append((lineNum + 1, line.rstrip('\r\n')))

	#
	# 結果が空か判定
	#
	def isEmpty(self):
		return self.value == []

	#
	# 出力整形用
	#
	def createOutputParts(self):
		grep = '\n'
		for val in self.value:
			grep += '%5d : %s\n' % (val[GrepResult.LINE_NUM], val[GrepResult.LINE])

		return grep

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('grepResult', self.value)
