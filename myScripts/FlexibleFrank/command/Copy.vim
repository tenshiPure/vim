python <<EOM
import vim

class Copy:

	#
	# 対象をコピーする
	#
	@staticmethod
	def execute(frank):
		if vim.current.buffer.name == pathFrank1:
			print 'cp ... frank2 only'
			return

		toEntry = Helper.getUnderCursorEntry(frank)
		if not(toEntry.isDir):
			print 'cp ... dir only'
			return

		toFullPathDQ = toEntry.fullPathDQ
		targetEntries = Helper.getTargetEntries(frank)

		if len(targetEntries) == 0:
			print 'cp ... no pointed'
			return

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
	@staticmethod
	def winFileCopy(targetEntry, toFullPathDQ):
		if myString.surround(targetEntry.putDir, '"') == toFullPathDQ:
			vim.command('silent !copy ' + targetEntry.fullPathDQ + ' ' + targetEntry.fullPathDQ + '_copy')
		else:
			vim.command('silent !copy ' + targetEntry.fullPathDQ + ' ' + toFullPathDQ)

	#
	# ファイルコピー : mac
	#
	@staticmethod
	def macFileCopy(targetEntry, toFullPathDQ):
		vim.command('silent !cp ' + targetEntry.fullPathDQ + ' ' + toFullPathDQ)

	#
	# ディレクトリコピー : win
	#
	@staticmethod
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
	@staticmethod
	def macDirCopy(targetEntry, toFullPathDQ):
		vim.command('silent !cp -R ' + targetEntry.fullPathDQ + ' ' + toFullPathDQ)

EOM
