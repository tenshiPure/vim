python <<EOM
import vim

class Explorer:

	#
	# ディレクトリを開く
	#
	@staticmethod
	def openDir(frank):
		targetEntry = Helper.getUnderCursorEntry(frank)

		if not(targetEntry.isDir):
			print 'open ... dir only'
			return

		if os.name == 'nt':
			vim.command('silent !explorer ' + targetEntry.fullPathDQ)
		else:
			vim.command('silent !open ' + targetEntry.fullPath)

	#
	# 指定ファイルをアプリケーションで開く
	#
	@staticmethod
	def openByApp(frank):
		targetEntry = Helper.getUnderCursorEntry(frank)

		if targetEntry.isDir:
			print 'app ... file only'
			return

		if os.name == 'nt':
			vim.command('silent !explorer ' + targetEntry.fullPathDQ)
		else:
			vim.command('silent !open ' + targetEntry.fullPath)

EOM
