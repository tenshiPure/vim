python <<EOM
import vim
import os

class OpenDir(CommandBase):

	commandName = 'OpenDir'

	#
	# ディレクトリを開く
	#
	def execute(self, frank):
		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		if not(targetEntry.isDir):
			raise TargetNotDirException(self.commandName)

		if os.name == 'nt':
			vim.command('silent !explorer \"%s\"' % targetEntry.fullPath)
		else:
			vim.command('silent !open ' + targetEntry.fullPath)

EOM
