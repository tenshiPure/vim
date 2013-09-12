python <<EOM
import vim
import os
import shutil

class Remove(CommandBase):

	commandName = 'Remove'
	firstLine = 0
	lastLine = 0

	#
	# 擬似コンストラクタ
	#
	def __init__(self, firstLine, lastLine):
		self.firstLine = firstLine
		self.lastLine = lastLine

	#
	# 対象をフランク３へ出力する
	#
	def execute(self, frank):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		targetEntries = CommandBase.getTargetEntries(self, frank, self.firstLine, self.lastLine)

		if len(targetEntries) == 0:
			raise NotPoiontedException(self.commandName)

		CommandBase.outputEntriesToFrank3(self, targetEntries)

		Tab.switchTab(pathFrank1, 3)

		Prev.targetEntries = targetEntries
		Prev.fix = self.fix
	
	#
	# 削除を実行する
	#
	def fix(self):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName)

		for targetEntry in Prev.targetEntries:
			if targetEntry.isDir:
				shutil.rmtree(targetEntry.fullPath)

			elif not(targetEntry.isDir):
				os.remove(targetEntry.fullPath)

		frank.reloadFrank()

		Tab.switchTab(pathFrank1, 3)

EOM
