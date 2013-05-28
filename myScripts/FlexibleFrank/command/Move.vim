python <<EOM
import vim
import os

class Move(CommandBase):

	commandName = 'Move'
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
	# 移動を実行する
	#
	def fix(self):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrank1Exception(self.commandName)

		toDir = CommandBase.getUnderCursorEntry(self, frank)

		if not(toDir.isDir):
			raise DestinationNotDirException(self.commandName)

		afterEntryNames = CommandBase.getEntryNamesFromFrank3(self)

		if len(Prev.targetEntries) != len(afterEntryNames):
			raise NotMatchEntryNumbersException(self.commandName)

		for index, beforeEntry in enumerate(Prev.targetEntries):
			afterFullPathDQ = MyString.surround(toDir.fullPath + os.path + afterEntryNames[index], '"')
			if os.name == 'nt':
				self.winMove(beforeEntry.fullPathDQ, afterFullPathDQ)
			else:
#				self.macMove(beforeEntry.fullPathDQ, toDir.fullPathDQ)
				self.macMove(beforeEntry.fullPathDQ, afterFullPathDQ)

		frank.reloadFrank()

	#
	# 移動 : win
	#
	def winMove(self, beforeFullPathDQ, afterFullPathDQ):
		vim.command('silent !move ' + beforeFullPathDQ + ' ' + afterFullPathDQ)

	#
	# 移動 : mac
	#
	def macMove(self, beforeFullPathDQ, afterFullPathDQ):
		vim.command('silent !mv ' + beforeFullPathDQ + ' ' + afterFullPathDQ)

EOM
