python <<EOM
import vim
import os

class Rename(CommandBase):

	commandName = 'Rename'
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

		MyTab.switchTab(pathFrank3, 3)

		Prev.targetEntries = targetEntries
		Prev.fix = self.fix

	#
	# リネームを実行する
	#
	def fix(self):
		afterEntryNames = CommandBase.getEntryNamesFromFrank3(self)

		if len(Prev.targetEntries) != len(afterEntryNames):
			raise NotMatchEntryNumbersException(self.commandName)

		for index, beforeEntry in enumerate(Prev.targetEntries):
			afterFullPath = beforeEntry.putDir + os.sep + afterEntryNames[index]
			os.rename(beforeEntry.fullPath, afterFullPath)

		frank.reloadFrank()

		MyTab.switchTab(pathFrank1, 3)

EOM
