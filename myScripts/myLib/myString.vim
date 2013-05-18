python <<EOM

class myString:

	#
	# 空行判定
	#
	def isBlankLine(line):
		if re.search('[^\ \t]', line) is None:
			return True
		else:
			return False

	#
	# 任意の文字を指定の文字で囲む
	#
	def surround(targetString, surroundString):
		return surroundString + targetString + surroundString

	isBlankLine = staticmethod(isBlankLine)
	surround = staticmethod(surround)
EOM
