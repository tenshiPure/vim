python <<EOM
import vim

class Helper:

	#
	# カーソル下のエントリを取得する
	#
	@staticmethod
	def getUnderCursorEntry(frank):
		currentLine = MyCursor().getCursorLineNum()
		return frank.linedEntries[currentLine]

	#
	# ポイントエントリもしくはカーソル下エントリを取得する
	#
	@staticmethod
	def getTargetEntries(frank, under = ''):
		result = []
		for entry in frank1.entries:
			if entry.pointed:
				result.append(entry)

		if under == 'under':
			if len(result) == 0:
				result.append(Helper.getUnderCursorEntry(frank))

		return result

	#
	# エントリがディレクトリのみか判定する
	#
	@staticmethod
	def isDirOnly(entries):
		for entry in entries:
			if not(entry.isDir):
				return False
		return True

	#
	# エントリがファイルのみか判定する
	#
	@staticmethod
	def isFileOnly(entries):
		for entry in entries:
			if entry.isDir:
				return False
		return True

	#
	# エントリが同一タイプのみか判定する
	#
	@staticmethod
	def isOnlySameTypeEntries(entries):
		return Helper.isDirOnly(entries) or Helper.isFileOnly(entries)

EOM
