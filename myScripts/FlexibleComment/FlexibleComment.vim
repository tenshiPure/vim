python <<EOM
import vim
import re

class FlexibleComment:

	extension = ''
	mode = ''
	firstLine = 0
	lastLine = 0

	#
	# 擬似コンストラクタ
	#
	def __init__(self, extension, mode, firstLine, lastLine):
		self.extension = extension
		self.mode = mode
		self.firstLine = int(firstLine) - 1
		self.lastLine = int(lastLine) - 1

	#
	# コントローラから呼ばれるメソッド
	#
	def execute(self):
		for lineNum in range(self.firstLine, self.lastLine + 1):
			line = vim.current.buffer[lineNum]

			if myString.isBlankLine(line):
				continue

			commentStyle = self.getCommentStyle(line)

			top = CommentStyle.getTop(commentStyle)
			tail = CommentStyle.getTail(commentStyle)

			if mode == 'add':
				self.add(lineNum, line, top, tail)

			elif mode == 'delete':
				self.delete(lineNum, line, top, tail)

			elif mode == 'switch':
				self.switch(lineNum, line, top, tail)

		return

	#
	# コメント状態にする
	#
	def add(self, lineNum, line, top, tail):
		vim.current.buffer[lineNum] = top + line + tail

	#
	# コメント状態を解除する
	#
	def delete(self, lineNum, line, top, tail):
		cutTop = line.replace(top, '', 1)
		cutTopTail = cutTop.replace(tail, '', 1)
		vim.current.buffer[lineNum] = cutTopTail

	#
	# コメント状態を逆転する
	#
	def switch(self, lineNum, line, top, tail):
		if self.isCommentedLine(line, top):
			self.delete(lineNum, line, top, tail)
		else:
			self.add(lineNum, line, top, tail)
	
	#
	# コメントの形式を得る
	#
	def getCommentStyle(self, line):
		if self.extension != 'vim':
			return self.extension
		else:
			return 'py'

	#
	# コメント状態の行か判定する
	#
	def isCommentedLine(self, line, top):
		if re.search('^' + top, line) is None:
			return False
		else:
			return True
EOM
