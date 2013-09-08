#-*- coding: utf-8 -*-

#
# 操作元パスと操作先パスを対で扱うクラス
#
class PairPath:

	#
	# String src : 操作元パス
	# String dst : 操作先パス
	#
	def __init__(self, src, dst):
		self.src = src
		self.dst = dst
