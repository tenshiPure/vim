python <<EOM
import vim
import os

class Delete(CommandBase):

	commandName = 'Delete'
	firstLine = 0
	lastLine = 0

	#
	# 擬似コンストラクタ
	#
	def __init__(self, firstLine, lastLine):
		self.firstLine = firstLine
		self.lastLine = lastLine

	#
	# 対象を削除する
	#
	def execute(self, frank):
		targetEntries = CommandBase.getTargetEntries(self, frank)

		for targetEntry in targetEntries:
			if not(targetEntry.isDir):
				if os.name == 'nt':
					vim.command('silent !del "' + targetEntry.fullPath + '"')
				else:
					vim.command('silent !rm "' + targetEntry.fullPath + '"')

			if targetEntry.isDir:
				if os.name == 'nt':
					vim.command('silent !rmdir /s /q "' + targetEntry.fullPath + '"')
				else:
					vim.command('silent !rm -r "' + targetEntry.fullPath + '"')

		frank.reloadFrank()

EOM
