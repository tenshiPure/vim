python <<EOM
import vim
import os

class QuickLook(CommandBase):

	commandName = 'QuickLook'

	#
	# 指定ファイルをクイックルックで開く
	#
	def execute(self, frank):
		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		if targetEntry.isDir:
			raise TargetNotFileException(self.commandName)

		if os.name == 'nt':
			pass
		else:
			vim.command('silent !qlmanage -p %s >& /dev/null' % targetEntry.fullPath)

EOM
