# -*- coding:utf-8 -*-

class OutputGrep:

	#
	# コンストラクタ
	#
	def __init__(self, point, grepResult, path):
		mark = point.getMark()
		path = path.getPath()
		grep = grepResult.getGrep()

		self.value = mark + path + grep

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('output', self.value)
