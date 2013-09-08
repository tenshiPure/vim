#-*- coding: utf-8 -*-
import os
import os.path

from PairPath import PairPath
from Move import Move

#
# エントリの削除を行う
#
class Remove:
	
	trashPath = 'Operate/TrashBox'

	#
	# [String] targetEntries : 作成するディレクトリ名
	#
	def __init__(self, targetEntries):
		self.targetEntries = targetEntries 
		self.move = None

	#
	# 実行
	#
	def execute(self):
		self.move = None
		pairPaths = []
		for targetEntry in self.targetEntries:
			entryName = targetEntry.rsplit(os.sep, 1)[1]
			inTrashPath = os.path.join(Remove.trashPath, entryName)

			pairPaths.append(PairPath(targetEntry, inTrashPath))

		self.move = Move(pairPaths)
		self.move.execute()

	#
	# 実行取り消し
	#
	def unexecute(self):
		self.move.unexecute()
