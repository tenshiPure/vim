python <<EOM

from abc import ABCMeta, abstractmethod

class Base:

	__metaclass__ = ABCMeta

	#
	# コンストラクタ
	#
	def __init__(self, behavior, firstLine, lastLine, option):
		self.buf = _Buffer()
		self.behavior = behavior
		self.firstLine = firstLine
		self.lastLine = lastLine
		self.option = option

	#
	# 実行
	#
	def execute(self):
		if self.behavior in ['commentAdd', 'commentDelete', 'commentSwitch']:
			self.commentLoop()
		elif self.behavior == 'make':
			self.make()
		elif self.behavior == 'test':
			self.test()
		elif self.behavior == 'log':
			self.log()

	#
	# コメント操作のための選択行ループ
	#
	def commentLoop(self):
		pos = Cursor.getPos()

		for lineNum, line in self.buf.getPartOfLinesWithLineNum(self.firstLine, self.lastLine):
			if String.isBlankLine(line):
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

		Cursor.setPos(pos)

	#
	# コメント形式を得る
	#
	@abstractmethod
	def getCommentStyle(self, lineNum, line):
		pass

	#
	# コメント状態にする
	#
	def commentAdd(self, lineNum, line, commentStyleHead, commentStyleTail):
		line = commentStyleHead + line + commentStyleTail

		vim.current.buffer[lineNum - 1] = line

	#
	# コメント状態を解除する
	#
	def commentDelete(self, lineNum, line, commentStyleHead, commentStyleTail):
		line = line.replace(commentStyleHead, '', 1)
		line = line.replace(commentStyleTail, '', 1)

		vim.current.buffer[lineNum - 1] = line

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
	@abstractmethod
	def make(self):
		pass

	#
	# ブラウザをリロードする
	#
	def browserReload(self, browser = 'chrome'):
		headDir = vim.eval('$MyScripts') + '/NotCareExtension/Scripts/Reload'

		if os.name == 'nt':
			scriptPath = '"' + os.path.abspath('%s/win/%s.exe' % (headDir, browser)) + '"'
			command = 'explorer'
		else:
			scriptPath = '%s/mac/%s.app' % (headDir, browser)
			command = 'open'

		vim.command('silent !%s %s' % (command, scriptPath))

	#
	# テストを実行する
	#
	@abstractmethod
	def test(self):
		pass

	#
	# ログを吐く文をソースに出力する
	#
	def log(self):
		texts = ['']
		texts.extend(self.getLogText())
		texts.append('')
		self.buf.append(self.lastLine, texts)

	#
	# ログ文を得る
	#
	@abstractmethod
	def getLogText(self):
		pass

EOM
