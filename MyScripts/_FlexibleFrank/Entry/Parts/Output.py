# -*- coding:utf-8 -*-

class Output:

	#
	# コンストラクタ
	#
	def __init__(self, point, depth, name, type):
		mark = point.createOutputParts()
		tab = depth.createOutputParts()
		name = name.createOutputParts()
		space = type.createOutputParts()

		self.value = mark + tab + name + space

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('output', self.value)
