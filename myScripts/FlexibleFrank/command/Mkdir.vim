python <<EOM
import vim
import os

class Mkdir(CommandBase):

	commandName = 'Mkdir'

	#
	# 対象をフランク３へ出力する
	#
	def execute(self, frank):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		CommandBase.outputStringToFrank3(self, 'new_dir')

		Prev.fix = self.fix
	
	#
	# ディレクトリ作成を実行する
	#
	def fix(self):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		toEntry = CommandBase.getUnderCursorEntry(self, frank)

		if not(toEntry.isDir):
			raise DestinationNotDirException(self.commandName)

		makingDirNames = CommandBase.getEntryNamesFromFrank3(self)

		for index, dirName in enumerate(makingDirNames):
			targetDirName = toEntry.fullPath + os.sep + dirName
			self.DirMake(MyString.surround(targetDirName, '"'))

		frank.reloadFrank()

		MyTab.switchTab(pathFrank1, 3)

	#
	# ディレクトリ作成
	#
	def DirMake(self, targetFullPath):
		vim.command('silent !mkdir ' + targetFullPath)

EOM
