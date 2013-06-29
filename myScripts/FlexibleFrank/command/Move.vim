python <<EOM
import vim
import os
import shutil

class Move(CommandBase):

	commandName = 'Move'
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
	# 移動を実行する
	#
	def fix(self):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		toDir = CommandBase.getUnderCursorEntry(self, frank)

		if not(toDir.isDir):
			raise DestinationNotDirException(self.commandName)

		afterEntryNames = CommandBase.getLinesFromFrank3(self)

		if len(Prev.targetEntries) != len(afterEntryNames):
			raise NotMatchEntryNumbersException(self.commandName)

		for index, beforeEntry in enumerate(Prev.targetEntries):
			afterFullPath = toDir.fullPath + os.sep + afterEntryNames[index]

			shutil.move(beforeEntry.fullPath, afterFullPath)

		frank.reloadFrank()

		Tab.switchTab(pathFrank1, 3)

EOM
