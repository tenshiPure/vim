python <<EOM
import vim

class Helper:

	#
	# 作業バッファかチェック
	#
	def isWorkingText():
		return vim.current.buffer.name.find('WorkingText.frank') != -1

	#
	# カーソル下のエントリを取得する
	#
	def getUnderCursorEntry(frank):
		currentLine = int(myCursor().getCursolLineNum())
		return frank.linedEntries[currentLine]

	isWorkingText = staticmethod(isWorkingText)
	getUnderCursorEntry = staticmethod(getUnderCursorEntry)
EOM
