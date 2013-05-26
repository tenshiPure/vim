python <<EOM
import vim

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
		targetEntries = CommandBase.getTargetEntries(self, frank)

		if len(targetEntries) == 0:
			raise NotPoiontedException(self.commandName)

		CommandBase.outputEntriesToFrank3(self, targetEntries)

		MyTab.switchTab(pathFrank1, 3)

		Prev.beforeEntries = targetEntries
		Prev.fix = self.fix

	#
	# リネームを実行する
	#
	def fix(self):
		afterEntryNames = CommandBase.getEntryNamesFromFrank3(self)

		if len(Prev.beforeEntries) != len(afterEntryNames):
			raise NotMatchEntryNumbersException(self.commandName)

		for index, beforeEntry in enumerate(Prev.beforeEntries):
			if os.name == 'nt':
				vim.command('silent !rename ' + beforeEntry.fullPathDQ + ' ' + afterEntryNames[index])
			else:
				vim.command('silent !mv ' + beforeEntry.fullPathDQ + ' ' + afterEntryNames[index])

		frank.reloadFrank()

EOM
