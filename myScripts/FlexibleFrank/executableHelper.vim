python <<EOM
import vim

class executableHelper:

	#
	#
	#
	def commandDispatch(frank, command):
		if not(executableHelper.isWorkingText()):
			return

		targetEntry = executableHelper.getUnderCursorEntry(frank)

		if targetEntry.isDir:
			commandOpen.openDir(targetEntry.underCurrentDepth)

	#
	# 作業バッファかチェック
	#
	def isWorkingText():
		return vim.current.buffer.name.find('WorkingText.frank') != -1

	#
	# カーソル下のエントリを取得する
	#
	def getUnderCursorEntry(frank):
		currentLine = int(myCursor().getCursolLine())
		return frank.linedEntries[currentLine]

	commandDispatch = staticmethod(commandDispatch)
	isWorkingText = staticmethod(isWorkingText)
	getUnderCursorEntry = staticmethod(getUnderCursorEntry)
EOM
