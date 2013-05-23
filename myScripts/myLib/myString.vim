python <<EOM

class MyString:

	#
	# 空行判定
	#
	@staticmethod
	def isBlankLine(line):
		if re.search('[^\ \t]', line) is None:
			return True
		else:
			return False

	#
	# 任意の文字を指定の文字で囲む
	#
	@staticmethod
	def surround(targetString, surroundString):
		return surroundString + targetString + surroundString

	#
	# カーソルのある行の文字列を取得する
	#
	@staticmethod
	def getUnderCursorLine():
		currentLineNum = MyCursor().getCursorLineNum()
		return vim.current.buffer[currentLineNum - 1]
EOM
