python <<EOM
import vim

class OpenDir(CommandBase):

	#
	# ディレクトリを開く
	#
	def execute(self, frank):
		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		if not(targetEntry.isDir):
			print 'open ... dir only'
			return

		if os.name == 'nt':
			vim.command('silent !explorer ' + targetEntry.fullPathDQ)
		else:
			vim.command('silent !open ' + targetEntry.fullPath)

EOM
