python <<EOM
import vim

class Open:

	#
	# ディレクトリを開く
	#
	def execute(frank):
		if not(Helper.isWorkingText()):
			return

		targetEntry = Helper.getUnderCursorEntry(frank)

		if targetEntry.isDir == False:
			return

		if os.name == 'nt':
			vim.command('silent !explorer ' + targetEntry.underCurrentDepth)
		else:
			vim.command('execute silent !open ' + targetEntry.underCurrentDepth)

	execute = staticmethod(execute)
EOM
