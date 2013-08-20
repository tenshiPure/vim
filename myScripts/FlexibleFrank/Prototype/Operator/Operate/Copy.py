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
		self.copiedEntries = []

	#
	# 実行
	#
	def execute(self):
		self.copiedEntries = []

		for pairPath in self.pairPaths:
			if os.path.isdir(pairPath.src):
				os.makedirs(pairPath.dst)

			if os.path.isfile(pairPath.src):
				shutil.copy(pairPath.src, pairPath.dst)

			self.copiedEntries.append(pairPath.dst)

	#
	# 実行取り消し
	#
	def unexecute(self):
		for copiedEntry in self.copiedEntries[::-1]:
			if os.path.isdir(copiedEntry):
				os.rmdir(copiedEntry)

			if os.path.isfile(copiedEntry):
				os.remove(copiedEntry)


currentFile = __file__
currentDir = os.path.dirname(currentFile)
rootDir = currentDir + '/..'
testDir = os.path.join(rootDir, 'TestDir')

src1 = os.path.join(testDir, 'src')
dst1 = os.path.join(testDir, 'dst')

src2 = os.path.join(testDir, 'src/src.txt')
dst2 = os.path.join(testDir, 'dst/dst.txt')

sut = Copy([PairPath(src1, dst1), PairPath(src2, dst2)])
sut.execute()
sut.unexecute()
