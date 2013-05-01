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

		toFullPathDQ = toEntry.fullPathDQ
		targetEntries = Helper.getTargetEntries(frank)

		for targetEntry in targetEntries:
			if not(targetEntry.isDir):
				if os.name == 'nt':
					Copy.winFileCopy(targetEntry, toFullPathDQ)
				else:
					Copy.macFileCopy(targetEntry, toFullPathDQ)

			if targetEntry.isDir:
				if os.name == 'nt':
					Copy.winDirCopy(targetEntry, toFullPathDQ)
				else:
					Copy.macDirCopy(targetEntry, toFullPathDQ)

	#
	# ファイルコピー : win
	#
	def winFileCopy(targetEntry, toFullPathDQ):
		if myString.surround(targetEntry.putDir, '"') == toFullPathDQ:
			vim.command('silent !copy ' + targetEntry.fullPathDQ + ' ' + targetEntry.fullPathDQ + '_copy')
		else:
			vim.command('silent !copy ' + targetEntry.fullPathDQ + ' ' + toFullPathDQ)

	#
	# ファイルコピー : mac
	#
	def macFileCopy(targetEntry, toFullPathDQ):
		vim.command('silent !cp ' + targetEntry.fullPathDQ + ' ' + toFullPathDQ)

	#
	# ディレクトリコピー : win
	#
	def winDirCopy(targetEntry, toFullPathDQ):
		if myString.surround(targetEntry.putDir, '"') == toFullPathDQ:
			toMadeDir = toFullPathDQ + '\\' + targetEntry.entryName + '_copy'
			vim.command('silent !mkdir ' + toMadeDir)
			vim.command('silent !xcopy /e ' + targetEntry.fullPathDQ + ' ' + toMadeDir)
		else:
			toMadeDir = toFullPathDQ + '\\' + targetEntry.entryName
			vim.command('silent !mkdir ' + toMadeDir)
			vim.command('silent !xcopy /e ' + targetEntry.fullPathDQ + ' ' + toMadeDir)

	#
	# ディレクトリコピー : mac
	#
	def macDirCopy(targetEntry, toFullPathDQ):
		vim.command('silent !cp ' + targetEntry.fullPathDQ + ' ' + toFullPathDQ)

	execute = staticmethod(execute)
	winFileCopy = staticmethod(winFileCopy)
	macFileCopy = staticmethod(macFileCopy)
	winDirCopy = staticmethod(winDirCopy)
	macDirCopy = staticmethod(macDirCopy)
EOM
