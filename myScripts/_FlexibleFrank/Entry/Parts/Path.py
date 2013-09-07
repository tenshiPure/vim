# -*- coding:utf-8 -*-

class Path:

	#
	# コンストラクタ
	#
	def __init__(self, path):
		self.value = path

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('path', self.value)
