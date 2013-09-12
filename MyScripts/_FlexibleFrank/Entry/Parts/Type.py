# -*- coding:utf-8 -*-

class Type:

	DIRECTORY = 'dir'
	FILE = 'file'

	#
	# コンストラクタ
	#
	def __init__(self, type):
		self.value = type

	#
	# ディレクトリか判定
	#
	def isDirectory(self):
		return self.value == Type.DIRECTORY

	#
	# ファイルか判定
	#
	def isFile(self):
		return self.value == Type.FILE

	#
	# 出力整形用
	#
	def createOutputParts(self):
		return '_' if self.isDirectory() else ''

	#
	# 文字列出力
	#
	def __str__(self):
		return '%-20s : %s' % ('type', self.value)
