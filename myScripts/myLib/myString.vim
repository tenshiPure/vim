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

	isBlankLine = staticmethod(isBlankLine)

EOM
