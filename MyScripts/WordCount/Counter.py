#-*- coding: utf-8 -*-

from Buf import Buf

class Counter:

	#
	# コンストラクタ
	#
	def __init__(self, args):
		self.args = args
		self.results = []
		self.buf = Buf()

	#
	# 実行
	#
	def execute(self):
		for arg in self.args:
			self.results.append((arg, self.count(arg)))

		self.output()

	#
	# バッファ内で文字列検索
	#
	def count(self, arg):
		result = 0
		for line in self.buf.loop():
			result += line.count(arg)

		return result

	#
	# 出力
	#
	def output(self):
		for result in self.results:
			print '%s : %d' % (result[0], result[1])
