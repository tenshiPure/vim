# -*- coding:utf-8 -*-

class Extension:

	#
	# コンストラクタ
	#
	def __init__(self, fullPath):
		try:
			self.value = fullPath.rsplit('.', 1)[1]
		except:
			self.value = None

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('extension', self.value)
