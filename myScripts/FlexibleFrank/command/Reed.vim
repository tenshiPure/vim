python <<EOM
import vim

class Reed(CommandBase):

	commandName = 'Reed'

	#
	# 指定ファイルをフランク２に表示
	#
	def execute(self, frank):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrank1Exception(self.commandName)

		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		MyTab.switchTab(pathFrank2, 3)
		MyTab.clearCurrentBuffer()

		vim.command('r ' + targetEntry.fullPath)
		del vim.current.buffer[0]

		MyTab.switchTab(pathFrank1, 3)
EOM
