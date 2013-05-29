python <<EOM
import vim

class Reed(CommandBase):

	commandName = 'Reed'

	#
	# 指定ファイルをフランク２に表示
	#
	def execute(self, frank):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		if targetEntry.isDir:
			raise TargetNotFileException(self.commandName)

		MyTab.switchTab(pathFrank2, 3)
		MyTab.clearCurrentBuffer()

		vim.command('r ' + targetEntry.fullPath)
		del vim.current.buffer[0]

		vim.command('set filetype=' + targetEntry.extension)
		vim.command('set nowrap')

		MyTab.switchTab(pathFrank1, 3)

EOM
