python <<EOM
import vim
import os

class Copy(CommandBase):

	commandName = 'Copy'

	#
	# 対象をコピーする
	#
	def execute(self, frank):
		toEntry = CommandBase.getUnderCursorEntry(self, frank)
		if not(toEntry.isDir):
			raise DestinationNotDirException(self.commandName)

		toFullPathDQ = toEntry.fullPathDQ
		targetEntries = CommandBase.getTargetEntries(self, frank)

		if len(targetEntries) == 0:
			raise NotPoiontedException(self.commandName)

		for targetEntry in targetEntries:
			if not(targetEntry.isDir):
				if os.name == 'nt':
					self.winFileCopy(targetEntry, toFullPathDQ)
				else:
					self.macFileCopy(targetEntry, toFullPathDQ)

			if targetEntry.isDir:
				if os.name == 'nt':
					self.winDirCopy(targetEntry, toFullPathDQ)
				else:
					self.macDirCopy(targetEntry, toFullPathDQ)

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
