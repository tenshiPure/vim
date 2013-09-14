#-*- coding: utf-8 -*-

#
# Vimのカレントバッファを表すクラス
class Buffer:

	#
	# コンストラクタ
	#
	def __init__(self):
		self.lines = ['mockLine1 mapmapmap', 'mockLine2 mapletmap']

	#
	# 行を返す
	#
	def getLines(self):
		return self.lines
