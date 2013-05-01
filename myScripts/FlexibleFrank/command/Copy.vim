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

		toFullPath = toEntry.fullPath
		targetEntries = Helper.getTargetEntries(frank)

		for targetEntry in targetEntries:
			if not(targetEntry.isDir):
				if os.name == 'nt':
					vim.command('silent !copy "' + targetEntry.fullPath + '" "' + toFullPath + '"')
				else:
					vim.command('silent !cp "' + targetEntry.fullPath + '" "' + toFullPath + '"')

			if targetEntry.isDir:
				if os.name == 'nt':
					toMadeDir = toFullPath + '\\' + targetEntry.entryName
					vim.command('silent !mkdir "' + toMadeDir + '"')
					vim.command('silent !xcopy /e "' + targetEntry.fullPath + '" "' + toMadeDir + '"')
				else:
					vim.command('silent !cp "' + targetEntry.fullPath + '" "' + toFullPath + '"')

	execute = staticmethod(execute)
EOM
