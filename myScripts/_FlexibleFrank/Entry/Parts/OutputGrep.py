# -*- coding:utf-8 -*-

class OutputGrep:

	#
	# コンストラクタ
	#
	def __init__(self, point, grepResult, path):
		mark = point.createOutputParts()
		path = path.createOutputParts()
		grep = grepResult.createOutputParts()

		self.value = mark + path + grep

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('output', self.value)
