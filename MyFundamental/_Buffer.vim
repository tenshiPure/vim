python <<EOM

class _Buffer():

	#
	# コンストラクタ
	#
	def __init__(self):
		self.name = vim.current.buffer.name
		self.lines = self.getLines()
		self.len = len(self.lines) - 1
		self.currentCorsurLine = self.lines[Cursor.getCursorLineNum()]

	#
	# 行を取得する
	#
	def getLines(self):
		result = []
		result.append('')
		for line in vim.current.buffer:
			result.append(line)

		return result

	#
	# 指定間の行を取得する
	#
	def getPartOfLines(self, firstLine, lastLine):
		return self.lines[firstLine : lastLine + 1]

	#
	# 指定間の行を行番号と共に取得する
	#
	def getPartOfLinesWithLineNum(self, firstLine, lastLine):
		lineNums = range(firstLine, lastLine + 1)
		lines = self.getPartOfLines(firstLine, lastLine)

		return zip(lineNums, lines)

	#
	# 書き換え
	#
	def write(self, lineNum, line):
		self.lines[lineNum] = line
		self.replace()

	#
	# 書き足し
	#
	def append(self, lineNum, lines):
		count = 1
		for line in lines:
			self.lines.insert(lineNum + count, line)
			count += 1
		self.replace()

	#
	# バッファをリストと置き換える
	#
	def replace(self):
		buf = vim.current.buffer
		buf[:] = None
		for line in self.lines:
			buf.append(line)
		del buf[0:2]

	#
	# インスタンス変数出力
	#
	def debug(self):
		print self.name
		for line in self.lines:
			print line
		print self.len
		print self.currentCorsurLine

EOM
