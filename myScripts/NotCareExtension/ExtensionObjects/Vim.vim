python <<EOM

class Vim:

	#
	# コンストラクタ
	#
	def __init__(self, behavior, firstLine, lastLine, fileName):
		self.behavior = behavior
		self.firstLine = firstLine
		self.lastLine = lastLine
		self.fileName = fileName

	#
	# 実行
	#
	def execute(self):
		if self.behavior in ['commentAdd', 'commentDelete', 'commentSwitch']:
			self.commentLoop()
		elif self.behavior == 'make':
			self.make()

	#
	# コメント操作のための選択行ループ
	#
	def commentLoop(self):
		for lineNum in range(self.firstLine, self.lastLine + 1):
			line = vim.current.buffer[lineNum]

			if MyString.isBlankLine(line):
				continue

			commentStyle = self.getCommentStyle(lineNum, line)
			commentStyleHead = commentStyle['head']
			commentStyleTail = commentStyle['tail']

			if self.behavior == 'commentAdd':
				self.commentAdd(lineNum, line, commentStyleHead, commentStyleTail)

			elif self.behavior == 'commentDelete':
				self.commentDelete(lineNum, line, commentStyleHead, commentStyleTail)

			elif self.behavior == 'commentSwitch':
				self.commentSwitch(lineNum, line, commentStyleHead, commentStyleTail)

	#
	# コメント形式を得る
	#
	def getCommentStyle(self, lineNum, line):
		if line == 'python <<EOM' or line == 'EOM':
			return {'head' : '"', 'tail' : ''}

		buf = vim.current.buffer

		for index in range(lineNum - 1, -1, -1):
			if buf[index] == 'python <<EOM' or buf[index] == '"python <<EOM':
				return {'head' : '#', 'tail' : ''}
			elif buf[index] == 'EOM' or buf[index] == '"EOM':
				break

		return {'head' : '"', 'tail' : ''}

	#
	# コメント状態にする
	#
	def commentAdd(self, lineNum, line, commentStyleHead, commentStyleTail):
		vim.current.buffer[lineNum] = commentStyleHead + line + commentStyleTail

	#
	# コメント状態を解除する
	#
	def commentDelete(self, lineNum, line, commentStyleHead, commentStyleTail):
		cutTop = line.replace(commentStyleHead, '', 1)
		cutTopTail = cutTop.replace(commentStyleTail, '', 1)
		vim.current.buffer[lineNum] = cutTopTail

	#
	# コメント状態を入れ替える
	#
	def commentSwitch(self, lineNum, line, commentStyleHead, commentStyleTail):
		if self.isCommentedLine(line, commentStyleHead):
			self.commentDelete(lineNum, line, commentStyleHead, commentStyleTail)
		else:
			self.commentAdd(lineNum, line, commentStyleHead, commentStyleTail)

	#
	# コメント状態を判定する
	#
	def isCommentedLine(self, line, commentStyleHead):
		if re.search('^' + commentStyleHead, line) is None:
			return False
		else:
			return True

	#
	# 実行動作を行う
	#
	def make(self):
		pass

EOM
