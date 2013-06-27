python <<EOM

class My_Buffer():

	#
	# コンストラクタ
	#
	def __init__(self):
		self.name = vim.current.buffer.name
		self.lines = self.getLines()
		self.len = len(self.lines) - 1
		self.currentCorsurLine = self.lines[MyCursor.getCursorLineNum()]

	#
	# 行をリストとして取得する
	#
	def getLines(self):
		result = []
		result.append('')
		for line in vim.current.buffer:
			result.append(line)

		return result

	#
	# リストでバッファを置き換える
	#
	def replaceBufferWithList(self, list):
		MyBuffer.clearCurrentBuffer()

		for line in list:
			vim.current.buffer.append(line)
		del vim.current.buffer[0]

	#
	# カレントバッファを空にする
	#
	def clearCurrentBuffer(self):
		vim.current.buffer[:] = None

	def debug(self):
		print self.name
		print self.lines
		print self.len
		print self.currentCorsurLine

EOM
