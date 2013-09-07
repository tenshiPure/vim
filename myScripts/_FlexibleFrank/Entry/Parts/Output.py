# -*- coding:utf-8 -*-

class Output:

	#
	# コンストラクタ
	#
	def __init__(self, name, point, depth, type):
		mark = '*' if point.isOn() else ''
		tab = '.' * depth.value
		space = '_' if type.isDirectory() else ''
		self.value = mark + tab + name.value + space

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('output', self.value)
