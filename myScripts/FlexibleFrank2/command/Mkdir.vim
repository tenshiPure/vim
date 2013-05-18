python <<EOM
import vim
import os

class Mkdir:

	#
	# 新規ディレクトリを作成する
	#
	@staticmethod
	def execute(frank):
		if myTab.isFrank2():
			return

		toEntry = Helper.getUnderCursorEntry(frank)
		if not(toEntry.isDir):
			return

		toFullPathDQ = toEntry.fullPathDQ + os.sep
		vim.command('silent !mkdir ' + toFullPathDQ + 'new_dir')

EOM
