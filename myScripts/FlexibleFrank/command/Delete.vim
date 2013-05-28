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
	# 対象をフランク３へ出力する
	#
	def execute(self, frank):
		targetEntries = CommandBase.getTargetEntries(self, frank, self.firstLine, self.lastLine)

		if len(targetEntries) == 0:
			raise NotPoiontedException(self.commandName)

		CommandBase.outputEntriesToFrank3(self, targetEntries)

		MyTab.switchTab(pathFrank1, 3)

		Prev.targetEntries = targetEntries
		Prev.fix = self.fix
	
	#
	# 削除を実行する
	#
	def fix(self):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrank1Exception(self.commandName)

		for targetEntry in Prev.targetEntries:
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
