python <<EOM
import vim
import os

class Remove(CommandBase):

	commandName = 'Remove'
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
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

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
			raise NotExecutedFrankNException(self.commandName)

		for targetEntry in Prev.targetEntries:
			if not(targetEntry.isDir):
				if os.name == 'nt':
					self.winFileRemove(targetEntry.fullPathDQ)
				else:
					self.macFileRemove(targetEntry.fullPathDQ)

			if targetEntry.isDir:
				if os.name == 'nt':
					self.winDirRemove(targetEntry.fullPathDQ)
				else:
					self.macDirRemove(targetEntry.fullPathDQ)

		frank.reloadFrank()

		MyTab.switchTab(pathFrank1, 3)

	#
	# ファイル削除 : win
	#
	def winFileRemove(self, targetFullPathDQ):
		vim.command('silent !del ' + targetFullPathDQ)
		
	#
	# ファイル削除 : mac
	#
	def macFileRemove(self, targetFullPathDQ):
		vim.command('silent !rm ' + targetFullPathDQ)

	#
	# ディレクトリ削除 : win
	#
	def winDirRemove(self, targetFullPathDQ):
		vim.command('silent !rmdir /s /q ' + targetFullPathDQ)
		
	#
	# ディレクトリ削除 : mac
	#
	def macDirRemove(self, targetFullPathDQ):
		vim.command('silent !rm -r ' + targetFullPathDQ)

EOM
