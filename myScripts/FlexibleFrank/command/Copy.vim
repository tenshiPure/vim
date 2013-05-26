python <<EOM
import vim
import os

class Copy(CommandBase):

	commandName = 'Copy'

	#
	# 対象をコピーする
	#
	def execute(self, frank):
		targetEntries = CommandBase.getTargetEntries(self, frank)

		if len(targetEntries) == 0:
			raise NotPoiontedException(self.commandName)

		CommandBase.outputEntriesToFrank3(self, targetEntries)

		MyTab.switchTab(pathFrank1, 3)

		Prev.beforeEntries = targetEntries

	#
	# コピーを実行する
	#
	def fix(self):
		toEntry = CommandBase.getUnderCursorEntry(self, frank)

		if not(toEntry.isDir):
			raise DestinationNotDirException(self.commandName)

		afterEntryNames = CommandBase.getEntryNamesFromFrank3(self)

		if len(Prev.beforeEntries) != len(afterEntryNames):
			raise NotMatchEntryNumbersException(self.commandName)

		for index, beforeEntry in enumerate(Prev.beforeEntries):
			afterFullPath = os.path.abspath(toEntry.fullPath + '/' + afterEntryNames[index])
			afterFullPathDQ = MyString.surround(afterFullPath, '"')
			if not(beforeEntry.isDir):
				if os.name == 'nt':
					self.winFileCopy(beforeEntry, afterFullPathDQ)
				else:
					self.macFileCopy(beforeEntry, afterFullPathDQ)

			if beforeEntry.isDir:
				if os.name == 'nt':
					self.winDirCopy(beforeEntry, afterFullPathDQ)
				else:
					self.macDirCopy(beforeEntry, afterFullPathDQ)

	#
	# ファイルコピー : win
	#
	def winFileCopy(self, targetEntry, toFullPathDQ):
		if MyString.surround(targetEntry.putDir, '"') == toFullPathDQ:
			vim.command('silent !copy ' + targetEntry.fullPathDQ + ' ' + targetEntry.fullPathDQ + '_copy')
		else:
			vim.command('silent !copy ' + targetEntry.fullPathDQ + ' ' + toFullPathDQ)

	#
	# ファイルコピー : mac
	#
	def macFileCopy(self, targetEntry, toFullPathDQ):
		vim.command('silent !cp ' + targetEntry.fullPathDQ + ' ' + toFullPathDQ)

	#
	# ディレクトリコピー : win
	#
	def winDirCopy(self, targetEntry, toFullPathDQ):
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
	def macDirCopy(self, targetEntry, toFullPathDQ):
		vim.command('silent !cp -R ' + targetEntry.fullPathDQ + ' ' + toFullPathDQ)

EOM
