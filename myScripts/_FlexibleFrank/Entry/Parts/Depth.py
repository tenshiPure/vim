# -*- coding:utf-8 -*-
import os

class Depth:

	#
	# コンストラクタ
	#
	def __init__(self, rootPath, fullPath):
		rootDepth = rootPath.count(os.sep)
		fullDepth = fullPath.count(os.sep)
		self.value = fullDepth - rootDepth - 1

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('depth', self.value)
