python <<EOM
import vim

class Helper:

	#
	# カーソル下のエントリを取得する
	#
	def getUnderCursorEntry(frank):
		currentLine = int(myCursor().getCursolLineNum())
		return frank.linedEntries[currentLine]

	#
	# ポイントエントリもしくはカーソル下エントリを取得する
	#
	def getTargetEntries(frank):
		result = []
		for entry in frank.linedEntries.itervalues():
			if entry.pointed:
				result.append(entry)

		if len(result) == 0:
			result.append(Helper.getUnderCursorEntry(frank))

		return result

	#
	# カーソルがある階層のフルパスを取得する
	#
	def getToFullPath(frank):
		currentLine = int(myCursor().getCursolLineNum())
		underCursorEntry = frank.linedEntries[currentLine]
		return underCursorEntry.fullPath.replace(underCursorEntry.entryName, '')

	getUnderCursorEntry = staticmethod(getUnderCursorEntry)
	getTargetEntries = staticmethod(getTargetEntries)
	getToFullPath = staticmethod(getToFullPath)
EOM
