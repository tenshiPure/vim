python <<EOM
import vim

class Rename(CommandBase):

	commandName = 'Rename'

	#
	# 対象をフランク３へ出力する
	#
	def execute(self, frank):
		targetEntries = CommandBase.getTargetEntries(self, frank)

		if len(targetEntries) == 0:
			raise NotPoiontedException(self.commandName)

		CommandBase.outputEntriesToFrank3(self, targetEntries)

		MyTab.switchTab(pathFrank1, 3)

		Prev.beforeEntries = targetEntries

	#
	# リネームを実行する
	#
	def fix(self):
		afterEntryNames = CommandBase.getEntryNamesFromFrank3(self)

		if len(Prev.beforeEntries) != len(afterEntryNames):
			raise NotMatchEntryNumbersException(self.commandName)

		for index, beforeEntry in enumerate(Prev.beforeEntries):
			if os.name == 'nt':
				vim.command('!rename ' + beforeEntry.fullPathDQ + ' ' + afterEntryNames[index])
			else:
				vim.command('silent !mv ' + beforeEntry.fullPathDQ + ' ' + afterEntryNames[index])

EOM
