python <<EOM
import vim
import os

class Mkdir(CommandBase):

	commandName = 'Mkdir'

	#
	# 対象をフランク３へ出力する
	#
	def execute(self, frank):
		CommandBase.outputStringToFrank3(self, 'new_dir')
	
	#
	# 移動を実行する
	#
	def fix(self):
		toEntry = CommandBase.getUnderCursorEntry(self, frank)

		if not(toEntry.isDir):
			raise DestinationNotDirException(self.commandName)

		makingDirNames = CommandBase.getEntryNamesFromFrank3(self)

		for index, dirName in enumerate(makingDirNames):
			vim.command('silent !mkdir "' + toEntry.fullPath + os.sep + dirName + '"')

EOM
