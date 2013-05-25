python <<EOM
import vim

class OpenByApp(CommandBase):

	#
	# 指定ファイルをアプリケーションで開く
	#
	def execute(self, frank):
		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		if targetEntry.isDir:
			raise TargetNotFileException('OpenByApp')

		if os.name == 'nt':
			vim.command('silent !explorer ' + targetEntry.fullPathDQ)
		else:
			vim.command('silent !open ' + targetEntry.fullPath)

EOM
