# -*- coding:utf-8 -*-

class Id:

	SERIAL_VALUE = 1

	#
	# 初期化
	#
	@staticmethod
	def initialize():
		Id.SERIAL_VALUE = 1

	#
	# コンストラクタ
	#
	def __init__(self):
		self.allocate()

	#
	# Idを割り当てる
	#
	def allocate(self):
		self.value = Id.SERIAL_VALUE
		Id.SERIAL_VALUE += 1

	#
	# 比較演算子
	#
	def __eq__(self, num):
		return self.value == num

	def __ne__(self, num):
		return self.value != num

	def __lt__(self, num):
		return self.value < num

	def __gt__(self, num):
		return self.value > num

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %d' % ('id', self.value)
