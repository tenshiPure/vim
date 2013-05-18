python <<EOM
import vim

class Move:

	#
	# ‘ÎÛ‚ðˆÚ“®‚·‚é
	#
	def execute(frank):
		if myTab.isFrank1():
			return

		toEntry = Helper.getUnderCursorEntry(frank)
		if not(toEntry.isDir):
			return

		targetEntries = Helper.getTargetEntries(frank)

		for targetEntry in targetEntries:
			if os.name == 'nt':
				vim.command('silent !move "' + targetEntry.fullPath + '" "' + toEntry.fullPath + '"')
			else:
				vim.command('silent !mv "' + targetEntry.fullPath + '" "' + toEntry.fullPath + '"')

	execute = staticmethod(execute)
EOM
