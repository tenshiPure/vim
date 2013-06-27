python <<EOM
import vim
import os

class OpenByApp(CommandBase):

	commandName = 'OpenByApp'

	#
	# 指定ファイルをアプリケーションで開く
	#
	def execute(self, frank):
		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		if targetEntry.isDir:
			raise TargetNotFileException(self.commandName)

		if os.name == 'nt':
			vim.command('silent !explorer \"%s\"' % targetEntry.fullPath)
		else:
			vim.command('silent !open ' + targetEntry.fullPath)

EOM
