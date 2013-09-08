# -*- coding:utf-8 -*-

class OutputGrep:

	#
	# コンストラクタ
	#
	def __init__(self, point, grepResults, path):
		mark = point.getMark()

		path = path.getPath()

		grep = '\n'
		for grepResult in grepResults:
			grep += '%5d : %s\n' % (grepResult[0], grepResult[1])

		self.value = mark + path + grep

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('output', self.value)
