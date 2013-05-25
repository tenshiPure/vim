python <<EOM
import vim
import os

class Mkdir(CommandBase):

	commandName = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, commandName):
		self.commandName = commandName

	#
	# 新規ディレクトリを作成する
	#
	def execute(self, frank):
		toEntry = CommandBase.getUnderCursorEntry(self, frank)
		if not(toEntry.isDir):
			raise DestinationNotDirException(self.commandName)

		toFullPathDQ = toEntry.fullPathDQ + os.sep
		vim.command('silent !mkdir ' + toFullPathDQ + 'new_dir')

EOM
