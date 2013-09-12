#-*- coding: utf-8 -*-
import os

from PairPath import PairPath

#
# エントリの名前変更を行う
#
class Rename:
	
	#
	# [PairPaths] pairPaths : 操作元と操作先が対になったオブジェクト
	#
	def __init__(self, pairPaths):
		self.pairPaths = pairPaths

	#
	# 実行
	#
	def execute(self):
		for pairPath in self.pairPaths:
			os.rename(pairPath.src, pairPath.dst)

	#
	# 実行取り消し
	#
	def unexecute(self):
		for pairPath in self.pairPaths:
			os.rename(pairPath.dst, pairPath.src)
