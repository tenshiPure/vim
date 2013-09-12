#-*- coding: utf-8 -*-
import os
import os.path
import shutil

from PairPath import PairPath

#
# エントリのコピーを行う
#
class Copy:
	
	#
	# [PairPaths] pairPaths : 操作元と操作先が対になったオブジェクト
	#
	def __init__(self, pairPaths):
		self.pairPaths = pairPaths
		self.copiedFiles = []
		self.copiedDirs = []

	#
	# 実行
	#
	def execute(self):
		self.copiedFiles = []
		self.copiedDirs = []

		for pairPath in self.pairPaths:
			if os.path.isfile(pairPath.src):
				shutil.copy(pairPath.src, pairPath.dst)
				self.copiedFiles.append(pairPath.dst)

			if os.path.isdir(pairPath.src):
				shutil.copytree(pairPath.src, pairPath.dst)
				self.copiedDirs.append(pairPath.dst)

	#
	# 実行取り消し
	#
	def unexecute(self):
		for copiedFile in self.copiedFiles:
			os.remove(copiedFile)

		for copiedDir in self.copiedDirs:
			shutil.rmtree(copiedDir)
