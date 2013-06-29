python <<EOM

class php(Base):

	#
	# コンストラクタ
	#
	def __init__(self, behavior, firstLine, lastLine, option):
		Base.__init__(self, behavior, firstLine, lastLine, option)

	#
	# コメント形式を得る
	#
	def getCommentStyle(self, lineNum, line):
		return {'head' : '//', 'tail' : ''}

	#
	# 実行動作を行う
	#
	def make(self):
		self.browserReload()

	#
	# テストを実行する
	#
	def test(self):
		testsDir = '/Users/ryo/Documents/projects/slf/tests'
		group = 'init' if self.option is None else self.option
		command = '!phpunit --stderr -c %s/phpunit.xml --group=%s %s/application/' %(testsDir, group, testsDir)

		vim.command(command)

	#
	# ログ文を得る
	#
	def getLogText(self):
		var = '' if self.option is None else self.option

		line1 = 'AppLog::debug(\'tenshi\');'
		line2 = 'AppLog::debug(print_r(%s, true));' % (var)
		
		return [line1, line2]

EOM
