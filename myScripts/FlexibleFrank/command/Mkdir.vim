python <<EOM
import vim
import os

class Mkdir:

	#
	# 新規ディレクトリを作成する
	#
	@staticmethod
	def execute(frank):
		toEntry = Helper.getUnderCursorEntry(frank)
		if not(toEntry.isDir):
			print 'mkdir ... dir only'
			return

		toFullPathDQ = toEntry.fullPathDQ + os.sep
		vim.command('silent !mkdir ' + toFullPathDQ + 'new_dir')

EOM