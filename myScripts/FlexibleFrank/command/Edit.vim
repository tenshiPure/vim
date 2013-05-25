python <<EOM
import vim

class Edit(CommandBase):

	commandName = 'Edit'

	#
	# 対象ファイルをタブで開く
	#
	def execute(self, frank):
		targetEntries = CommandBase.getTargetEntries(self, frank, 'under')

		if not(CommandBase.isFileOnly(self, targetEntries)):
			raise TargetNotFileOnlyException(self.commandName)

		tabCloser = TabCloser()
		tabCloser.execute()

		for index, targetEntry in enumerate(targetEntries):
			if index == 0 and MyTab.isBlankTab():
				vim.command('edit ' + targetEntry.fullPath)
			else:
				vim.command('tabedit ' + targetEntry.fullPath)

EOM
