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
	def getTargetEntries(frank, under = ''):
		result = []
		for entry in frank.linedEntries.itervalues():
			if entry.pointed:
				result.append(entry)

		if under == 'under':
			if len(result) == 0:
				result.append(Helper.getUnderCursorEntry(frank))

		return result

	#
	# エントリがディレクトリのみか判定する
	#
	def isDirOnly(entries):
		for entry in entries:
			if not(entry.isDir):
				return False
		return True

	#
	# エントリがファイルのみか判定する
	#
	def isFileOnly(entries):
		for entry in entries:
			if entry.isDir:
				return False
		return True

	#
	# エントリが同一タイプのみか判定する
	#
	def isOnlySameTypeEntries(entries):
		return Helper.isDirOnly(entries) or Helper.isFileOnly(entries)

	getUnderCursorEntry = staticmethod(getUnderCursorEntry)
	getTargetEntries = staticmethod(getTargetEntries)
	isDirOnly = staticmethod(isDirOnly)
	isFileOnly = staticmethod(isFileOnly)
	isOnlySameTypeEntries = staticmethod(isOnlySameTypeEntries)
EOM
