python <<EOM
import vim

class Grep(CommandBase):

	commandName = 'Grep'
	doneMessage = commandName + CommandBase.doneMessage

	#
	# ディレクトリを開く
	#
	def execute(self, frank):
		if vim.current.buffer.name != pathFrank3:
			raise NotExecutedFrankNException(self.commandName, 3)

		print 'Grep'

		print self.doneMessage

EOM
