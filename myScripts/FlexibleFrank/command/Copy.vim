python <<EOM
import vim

class Copy:

	#
	# 対象をコピーする
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
				vim.command('silent !copy "' + targetEntry.fullPath + '" "' + toEntry.fullPath + '"')
			else:
				vim.command('silent !cp "' + targetEntry.fullPath + '" "' + toEntry.fullPath + '"')

	execute = staticmethod(execute)
EOM
