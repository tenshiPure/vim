python <<EOM
import vim

class Move:

	#
	# ディレクトリを変更する
	#
	def execute(frank):
		if not(Helper.isWorkingText()):
			return

		targetEntry = Helper.getUnderCursorEntry(frank)

		if targetEntry.isDir == False:
			return

		vim.command('cd ' + targetEntry.fullPath)
		frank.reloadFrank()

	execute = staticmethod(execute)
EOM
