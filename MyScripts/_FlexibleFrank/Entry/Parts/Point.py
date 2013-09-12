# -*- coding:utf-8 -*-

class Point:

	OFF_VALUE = 0
	SERIAL_VALUE = 1

	#
	# 初期化
	#
	@staticmethod
	def initialize():
		Point.SERIAL_VALUE = 1

	#
	# コンストラクタ
	#
	def __init__(self):
		self.off()

	#
	# オンにする
	#
	def on(self):
		self.value = Point.SERIAL_VALUE
		Point.SERIAL_VALUE += 1

	#
	# オフにする
	#
	def off(self):
		self.value = Point.OFF_VALUE

	#
	# ポイントオンか判定する
	#
	def isOn(self):
		return self.value != Point.OFF_VALUE

	#
	# ポイントオフか判定する
	#
	def isOff(self):
		return self.value == Point.OFF_VALUE

	#
	# ポイント切り替え
	#
	def switch(self):
		if self.isOn():
			self.off()
		else:
			self.on()

	#
	# 出力整形用
	#
	def createOutputParts(self):
		return '*' if self.isOn() else ''

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('point', 'On' if self.isOn() else 'Off')
