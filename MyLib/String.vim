python <<EOM

class String:

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
	# カレントバッファの文字列を取得する　行指定/カーソル行
	#
	@staticmethod
	def getLineFromCurrentBuffer(lineNum = None):
		if lineNum is None:
			lineNum = Cursor.getCursorLineNum()

		return vim.current.buffer[lineNum - 1]

	#
	# カーソル下の単語を取得する
	#
	@staticmethod
	def getUnderCursorWord():
		return vim.eval('expand("<cword>")')

	#
	# ビジュアルモードで選択したテキストを取得する
	#
	@staticmethod
	def getVisualCommandText():
		vim.command('let tmp = @@')
		vim.command('silent normal gvy')
		vim.command('let selected = @@')
		vim.command('let @@ = tmp')
		return vim.eval('selected')

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
	
	#
	# コマンドをリダイレクトする
	#
	@staticmethod
	def commandRedirect(command, type):
		if type == 'out':
			return String.outterCommandRedirect(command)
		else:
			return None

	#
	# 文字変換
	#
	@staticmethod
	def convert(string, _from, _to):
		if _from == 'vim':
			result = string.decode(vim.eval('&encoding'))
		elif _from is not None:
			result = string.decode(_from)
		elif _from is None:
			result = string

		if _to == 'vim':
			result = result.encode(vim.eval('&encoding'))
		elif _to is not None:
			result = result.encode(_to)

		return result

	#
	# 指定の文字数に文字を調整する
	#
	@staticmethod
	def lenAdjust(string, limit, fill):
		if limit < len(string):
			return string[:limit]
		else:
			return string + fill * (limit - len(string))

EOM
