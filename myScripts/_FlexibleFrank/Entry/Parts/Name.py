# -*- coding:utf-8 -*-
import os

class Name:

	#
	# コンストラクタ
	#
	def __init__(self, fullPath):
		self.value = fullPath.rsplit(os.sep, 1)[1]

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('name', self.value)
