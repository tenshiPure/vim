python <<EOM
import vim

class Move:

	#
	# 対象を移動する
	#
	def execute(frank):
		if myTab.isFrank1():
			return

		toFullPath = Helper.getToFullPath(frank)
		targetEntries = Helper.getTargetEntries(frank)

		for targetEntry in targetEntries:
			if os.name == 'nt':
				vim.command('silent !move "' + targetEntry.fullPath + '" "' + toFullPath + '"')
			else:
				vim.command('silent !mv "' + targetEntry.fullPath + '" "' + toFullPath + '"')

	execute = staticmethod(execute)
EOM
