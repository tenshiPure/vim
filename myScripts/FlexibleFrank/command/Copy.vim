python <<EOM
import vim
import os
import shutil

class Copy(CommandBase):

	commandName = 'Copy'
	firstLine = 0
	lastLine = 0

	#
	# 擬似コンストラクタ
	#
	def __init__(self, firstLine, lastLine):
		self.firstLine = firstLine
		self.lastLine = lastLine

	#
	# 対象をコピーする
	#
	def execute(self, frank):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		targetEntries = CommandBase.getTargetEntries(self, frank, self.firstLine, self.lastLine)

		if len(targetEntries) == 0:
			raise NotPoiontedException(self.commandName)

		CommandBase.outputEntriesToFrank3(self, targetEntries)

		Tab.switchTab(pathFrank1, 3)

		Prev.targetEntries = targetEntries
		Prev.fix = self.fix

	#
	# コピーを実行する
	#
	def fix(self):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		dstDir = CommandBase.getUnderCursorEntry(self, frank)

		if not(dstDir.isDir):
			raise DestinationNotDirException(self.commandName)

		afterEntryNames = CommandBase.getLinesFromFrank3(self)

		if len(Prev.targetEntries) != len(afterEntryNames):
			raise NotMatchEntryNumbersException(self.commandName)

		for index, beforeEntry in enumerate(Prev.targetEntries):
			afterFullPath = os.path.abspath(dstDir.fullPath + os.sep + afterEntryNames[index])
			if beforeEntry.isDir:
				shutil.copytree(beforeEntry.fullPath, afterFullPath)
			elif not(beforeEntry.isDir):
				shutil.copy(beforeEntry.fullPath, afterFullPath)

		frank.reloadFrank()

		Tab.switchTab(pathFrank1, 3)

EOM
