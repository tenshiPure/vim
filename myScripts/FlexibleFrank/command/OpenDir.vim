python <<EOM
import vim
import os

class OpenDir(CommandBase):

	commandName = 'OpenDir'
	doneMessage = commandName + CommandBase.doneMessage

	#
	# ディレクトリを開く
	#
	def execute(self, frank):
		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		if not(targetEntry.isDir):
			raise TargetNotDirException(self.commandName)

		if os.name == 'nt':
			vim.command('silent !explorer ' + targetEntry.fullPathDQ)
		else:
			vim.command('silent !open ' + targetEntry.fullPath)

		print self.doneMessage

EOM
