python <<EOM
import vim
import re

class FlexibleComment:

	extension = ''
	mode = ''
	first_line = 0
	last_line = 0

	#
	# 擬似コンストラクタ
	#
	def __init__(self, extension, mode, first_line, last_line):
		self.extension = extension
		self.mode = mode
		self.first_line = int(first_line) - 1
		self.last_line = int(last_line) - 1

	#
	# コントローラから呼ばれるメソッド
	#
	def execute(self):
		for line_num in range(self.first_line, self.last_line + 1):
			line = vim.current.buffer[line_num]

			if myString.isBlankLine(line):
				continue

			comment_style = self.getCommentStyle(line)

			top = CommentStyle.getTop(comment_style)
			tail = CommentStyle.getTail(comment_style)

			if mode == 'add':
				self.add(line_num, line, top, tail)

			elif mode == 'delete':
				self.delete(line_num, line, top, tail)

			elif mode == 'switch':
				self.switch(line_num, line, top, tail)

		return

	#
	# コメント状態にする
	#
	def add(self, line_num, line, top, tail):
		vim.current.buffer[line_num] = top + line + tail

	#
	# コメント状態を解除する
	#
	def delete(self, line_num, line, top, tail):
		cut_top = line.replace(top, '', 1)
		cut_top_tail = cut_top.replace(tail, '', 1)
		vim.current.buffer[line_num] = cut_top_tail

	#
	# コメント状態を逆転する
	#
	def switch(self, line_num, line, top, tail):
		if self.isCommentedLine(line, top):
			self.delete(line_num, line, top, tail)
		else:
			self.add(line_num, line, top, tail)
	
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
