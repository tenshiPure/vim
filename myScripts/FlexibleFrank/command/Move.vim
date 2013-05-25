python <<EOM
import vim
import os

class Move(CommandBase):

	commandName = 'Move'

	#
	# 対象をフランク３へ出力する
	#
	def execute(self, frank):
		targetEntries = CommandBase.getTargetEntries(self, frank)

		if len(targetEntries) == 0:
			raise NotPoiontedException(self.commandName)

		CommandBase.outputToFrank3(self, targetEntries)

		MyTab.switchTab(pathFrank1, 3)

		Prev.lastCommand = self.commandName
		Prev.beforeEntries = targetEntries
	
	#
	# 移動を実行する
	#
	def fix(self):
		toEntry = CommandBase.getUnderCursorEntry(self, frank)
		if not(toEntry.isDir):
			raise DestinationNotDirException(self.commandName)

		afterEntryNames = CommandBase.getEntryNamesFromFrank3(self)

		if len(Prev.beforeEntries) != len(afterEntryNames):
			raise NotMatchEntryNumbersException(self.commandName)

		for index, beforeEntry in enumerate(Prev.beforeEntries):
			afterFullPath = os.path.abspath(toEntry.fullPath + '/' + afterEntryNames[index])
			if os.name == 'nt':
				vim.command('!move ' + beforeEntry.fullPathDQ + ' ' + MyString.surround(afterFullPath, '"'))
			else:
				vim.command('silent !mv "' + beforeEntry.fullPath + '" "' + toEntry.fullPath + '"')

EOM
