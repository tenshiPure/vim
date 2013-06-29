python <<EOM
import vim

class Edit(CommandBase):

	commandName = 'Edit'
	firstLine = 0
	lastLine = 0

	#
	# 擬似コンストラクタ
	#
	def __init__(self, firstLine, lastLine):
		self.firstLine = firstLine
		self.lastLine = lastLine

	#
	# 対象ファイルをタブで開く
	#
	def execute(self, frank):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		targetEntries = CommandBase.getTargetEntries(self, frank, self.firstLine, self.lastLine)

		if not(CommandBase.isFileOnly(self, targetEntries)):
			raise TargetNotFileOnlyException(self.commandName)

		Tab.close()

		for index, targetEntry in enumerate(targetEntries):
			if index == 0 and Tab.isBlankTab():
				vim.command('edit ' + targetEntry.fullPath)
			else:
				vim.command('tabedit ' + targetEntry.fullPath)


EOM
