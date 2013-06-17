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

	#
	# 指定行の文字列を取得する
	#
	@staticmethod
	def getTargetCursorLine(lineNum):
		return vim.current.buffer[lineNum - 1]

	#
	# 半角空白をエスケープする
	#
	@staticmethod
	def escapeSpace(targetString):
		return targetString.replace(' ', r'\ ')

	#
	# リストでバッファを置き換える
	#
	@staticmethod
	def replaceBufferWithList(list):
		buf = vim.current.buffer
		del buf[:]

		for row in list:
			buf.append(row)

		del buf[0]

	#
	# 内部コマンドをリダイレクトする
	#
	@staticmethod
	def innerCommandRedirect(command):
		vim.command('let s:grepResult = "no executed"')
		vim.command('redir! => s:grepResult')
		vim.command(command)
		vim.command('redir END')

		return vim.eval('s:grepResult')

	#
	# 外部コマンドを別バッファ経由でリダイレクトする
	#
	@staticmethod
	def outterCommandRedirect(command):
		vim.command('tabe')
		vim.command('r' + command)

		del vim.current.buffer[0]

		commandResult = []
		for row in vim.current.buffer:
			commandResult.append(row)

		vim.command('bdelete!')

		return commandResult
	
EOM
