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
			return

		if os.name == 'nt':
			vim.command('!explorer ' + targetEntry.fullPathDQ)
		else:
			vim.command('silent !open ' + targetEntry.fullPath)

	#
	# 指定ファイルをアプリケーションで開く
	#
	@staticmethod
	def openByApp(frank):
		targetEntry = Helper.getUnderCursorEntry(frank)

		if targetEntry.isDir:
			return

		if os.name == 'nt':
			vim.command('!explorer ' + targetEntry.fullPathDQ)
		else:
			vim.command('silent !open ' + targetEntry.fullPath)

EOM
