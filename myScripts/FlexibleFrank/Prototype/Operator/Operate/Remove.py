#-*- coding: utf-8 -*-
import os
import os.path
import shutil

from PairPath import PairPath

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

	#
	# 実行
	#
	def execute(self):
		for targetEntry in self.targetEntries:
			entryName = targetEntry.rsplit(os.sep, 1)[1]
			inTrashPath = os.path.join(Remove.trashPath, entryName)

			shutil.move(targetEntry, inTrashPath)

	#
	# 実行取り消し
	#
	def unexecute(self):
		pass
