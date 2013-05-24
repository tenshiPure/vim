python <<EOM
import vim

class OpenByApp:

	#
	# 指定ファイルをアプリケーションで開く
	#
	def execute(self, frank):
		targetEntry = CommandBase.getUnderCursorEntry(frank)

		if targetEntry.isDir:
			print 'app ... file only'
			return

		if os.name == 'nt':
			vim.command('silent !explorer ' + targetEntry.fullPathDQ)
		else:
			vim.command('silent !open ' + targetEntry.fullPath)

EOM
