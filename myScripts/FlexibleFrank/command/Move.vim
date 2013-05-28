python <<EOM
import vim
import os

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

		MyTab.switchTab(pathFrank1, 3)

		Prev.beforeEntries = targetEntries
		Prev.fix = self.fix
	
	#
	# 移動を実行する
	#
	def fix(self):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		toEntry = CommandBase.getUnderCursorEntry(self, frank)

		if not(toEntry.isDir):
			raise DestinationNotDirException(self.commandName)

		afterEntryNames = CommandBase.getEntryNamesFromFrank3(self)

		if len(Prev.beforeEntries) != len(afterEntryNames):
			raise NotMatchEntryNumbersException(self.commandName)

		for index, beforeEntry in enumerate(Prev.beforeEntries):
			afterFullPath = os.path.abspath(toEntry.fullPath + '/' + afterEntryNames[index])
			if os.name == 'nt':
				vim.command('silent !move ' + beforeEntry.fullPathDQ + ' ' + MyString.surround(afterFullPath, '"'))
			else:
				vim.command('silent !mv "' + beforeEntry.fullPath + '" "' + toEntry.fullPath + '"')

		frank.reloadFrank()

EOM
