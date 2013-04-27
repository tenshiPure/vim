python <<EOM
import vim

class commandOpen:

	#
	# コマンド　ディレクトリを開く
	#
	def commandOpen(frank):
		if not(commandOpen.isWorkingText()):
			return

		currentLine = int(myCursor().getCursolLine())
		target = frank.linedEntries[currentLine].underCurrentDepth

		if frank.linedEntries[currentLine].isDir:
			commandOpen.openDir(target)

	#
	# ディレクトリを開く
	#
	def openDir(target):
		if os.name == 'nt':
			vim.command('silent !explorer ' + target)
		else:
			vim.command('execute silent !open ' + target)

	#
	# 作業バッファかチェック
	#
	def isWorkingText():
		return vim.current.buffer.name.find('WorkingText.frank') != -1

	commandOpen = staticmethod(commandOpen)
	openDir = staticmethod(openDir)
	isWorkingText = staticmethod(isWorkingText)
EOM
