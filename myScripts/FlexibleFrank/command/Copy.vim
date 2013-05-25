python <<EOM
import vim

class Copy(CommandBase):

	#
	# 対象をコピーする
	#
	def execute(self, frank):
		toEntry = CommandBase.getUnderCursorEntry(self, frank)
		if not(toEntry.isDir):
			raise DestinationNotDirException('Copy')

		toFullPathDQ = toEntry.fullPathDQ
		targetEntries = CommandBase.getTargetEntries(self, frank)

		if len(targetEntries) == 0:
			raise NotPoiontedException('Copy')

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
		if MyString.surround(targetEntry.putDir, '"') == toFullPathDQ:
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
		if MyString.surround(targetEntry.putDir, '"') == toFullPathDQ:
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
		vim.command('silent !cp -R ' + targetEntry.fullPathDQ + ' ' + toFullPathDQ)

EOM
