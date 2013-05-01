python <<EOM
import vim

class Copy:

	#
	# 対象をコピーする
	#
	def execute(frank):
		if myTab.isFrank1():
			return

		toFullPath = Helper.getToFullPath(frank)
		targetEntries = Helper.getTargetEntries(frank)

		for targetEntry in targetEntries:
			if os.name == 'nt':
				vim.command('silent !copy "' + targetEntry.fullPath + '" "' + toFullPath + '"')
			else:
				vim.command('silent !cp "' + targetEntry.fullPath + '" "' + toFullPath + '"')

	execute = staticmethod(execute)
EOM
