python <<EOM
import vim

class Explorer:

	#
	# ディレクトリを開く
	#
	def openDir(frank):
		if not(Helper.isWorkingText()):
			return

		targetEntry = Helper.getUnderCursorEntry(frank)

		if not(targetEntry.isDir):
			return

		if os.name == 'nt':
			vim.command('silent !explorer ' + targetEntry.underCurrentDepth)
		else:
			vim.command('silent !open ' + targetEntry.underCurrentDepth)

	#
	# 指定ファイルをアプリケーションで開く
	#
	def openByApp(frank):
		if not(Helper.isWorkingText()):
			return

		targetEntry = Helper.getUnderCursorEntry(frank)

		if targetEntry.isDir:
			return

		if os.name == 'nt':
			vim.command('silent !explorer ' + targetEntry.underCurrentDepth)
		else:
			vim.command('silent !open ' + targetEntry.underCurrentDepth)

	openDir = staticmethod(openDir)
	openByApp = staticmethod(openByApp)
EOM
