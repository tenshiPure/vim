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
					Copy.winFileCopy(targetEntry, toFullPath)
				else:
					Copy.macFileCopy(targetEntry, toFullPath)

			if targetEntry.isDir:
				if os.name == 'nt':
					Copy.winDirCopy(targetEntry, toFullPath)
				else:
					Copy.macDirCopy(targetEntry, toFullPath)

	#
	# ファイルコピー : win
	#
	def winFileCopy(targetEntry, toFullPath):
		if targetEntry.putDir == toFullPath:
			vim.command('silent !copy "' + targetEntry.fullPath + '" "' + targetEntry.fullPath + '_copy"')
		else:
			vim.command('silent !copy "' + targetEntry.fullPath + '" "' + toFullPath + '"')

	#
	# ファイルコピー : mac
	#
	def macFileCopy(targetEntry, toFullPath):
		vim.command('silent !cp "' + targetEntry.fullPath + '" "' + toFullPath + '"')

	#
	# ディレクトリコピー : win
	#
	def winDirCopy(targetEntry, toFullPath):
		if targetEntry.putDir == toFullPath:
			toMadeDir = toFullPath + '\\' + targetEntry.entryName + '_copy'
			vim.command('silent !mkdir "' + toMadeDir + '"')
			vim.command('silent !xcopy /e "' + targetEntry.fullPath + '" "' + toMadeDir + '"')
		else:
			toMadeDir = toFullPath + '\\' + targetEntry.entryName
			vim.command('!mkdir "' + toMadeDir + '"')
			vim.command('silent !xcopy /e "' + targetEntry.fullPath + '" "' + toMadeDir + '"')

	#
	# ディレクトリコピー : mac
	#
	def macDirCopy(targetEntry, toFullPath):
		vim.command('silent !cp "' + targetEntry.fullPath + '" "' + toFullPath + '"')

	execute = staticmethod(execute)
	winFileCopy = staticmethod(winFileCopy)
	macFileCopy = staticmethod(macFileCopy)
	winDirCopy = staticmethod(winDirCopy)
	macDirCopy = staticmethod(macDirCopy)
EOM
