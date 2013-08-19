python <<EOM

class py(Base):

	#
	# コンストラクタ
	#
	def __init__(self, behavior, firstLine, lastLine, option):
		Base.__init__(self, behavior, firstLine, lastLine, option)

	#
	# コメント形式を得る
	#
	def getCommentStyle(self, lineNum, line):
		return {'head' : '#', 'tail' : ''}

	#
	# 実行動作を行う
	#
	def make(self):
		fileName = vim.current.buffer.name if self.option is None else self.option
		vim.command('!python \"%s\"' % fileName)

	#
	# テストを実行する
	#
	def test(self):
		testsDir = r'C:\Program Files (x86)\vim\gitvim\myScripts\FlexibleFrank\Prototype\Operator\Test'

		command = r'!C:\Python27\Scripts\nosetests "%s"' % (testsDir)

		vim.command(command)

	#
	# ログ文を得る
	#
	def getLogText(self):
		pass

EOM
