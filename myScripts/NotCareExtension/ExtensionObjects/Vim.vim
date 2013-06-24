python <<EOM

class Vim:

	commentStyleHead = '#'
	commentStyleTail = ''

	#
	# コンストラクタ
	#
	def __init__(self, behavior, firstLine, lastLine):
		self.behavior = behavior
		self.firstLine = firstLine
		self.lastLine = lastLine

	#
	# 実行
	#
	def execute(self):
		if self.behavior in ['commentAdd', 'commentDelete', 'commentSwitch']:
			self.commentLoop()

	#
	# コメント操作のための選択行ループ
	#
	def commentLoop(self):
		for lineNum in range(self.firstLine, self.lastLine + 1):
			line = vim.current.buffer[lineNum]

			if MyString.isBlankLine(line):
				continue

			if self.behavior == 'commentAdd':
				self.commentAdd(lineNum, line)

			elif self.behavior == 'commentDelete':
				self.commentDelete(lineNum, line)

			elif self.behavior == 'commentSwitch':
				self.commentSwitch(lineNum, line)

	#
	# コメント状態にする
	#
	def commentAdd(self, lineNum, line):
		vim.current.buffer[lineNum] = self.commentStyleHead + line + self.commentStyleTail

	#
	# コメント状態を解除する
	#
	def commentDelete(self, lineNum, line):
		cutTop = line.replace(self.commentStyleHead, '', 1)
		cutTopTail = cutTop.replace(self.commentStyleTail, '', 1)
		vim.current.buffer[lineNum] = cutTopTail

	#
	# コメント状態を入れ替える
	#
	def commentSwitch(self, lineNum, line):
		if self.isCommentedLine(line):
			self.commentDelete(lineNum, line)
		else:
			self.commentAdd(lineNum, line)

	#
	# コメント状態を判定する
	#
	def isCommentedLine(self, line):
		if re.search('^' + self.commentStyleHead, line) is None:
			return False
		else:
			return True

EOM
