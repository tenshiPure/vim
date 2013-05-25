python <<EOM
import vim
import os

class Mkdir(CommandBase):

	#
	# 新規ディレクトリを作成する
	#
	def execute(self, frank):
		toEntry = CommandBase.getUnderCursorEntry(self, frank)
		if not(toEntry.isDir):
			raise DestinationNotDirException('Mkdir')

		toFullPathDQ = toEntry.fullPathDQ + os.sep
		vim.command('silent !mkdir ' + toFullPathDQ + 'new_dir')

EOM
