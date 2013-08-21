#-*- coding: utf-8 -*-
import shutil

#
# エントリの移動を行う
#
class Move:
	
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
			shutil.move(pairPath.src, pairPath.dst)

	#
	# 実行取り消し
	#
	def unexecute(self):
		for pairPath in self.pairPaths:
			shutil.move(pairPath.dst, pairPath.src)
