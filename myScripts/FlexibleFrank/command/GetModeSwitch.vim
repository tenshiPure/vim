python <<EOM
import vim

class GetModeSwitch(CommandBase):

	commandName = 'GetModeSwitch'

	#
	# エントリの取得モードを切り替える
	#
	def execute(self, frank):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		frank.switchGetEntryMode()
		frank.reloadFrank()

EOM
