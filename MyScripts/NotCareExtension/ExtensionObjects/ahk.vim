python <<EOM

class ahk(Base):

	#
	# コンストラクタ
	#
	def __init__(self, behavior, firstLine, lastLine, option):
		Base.__init__(self, behavior, firstLine, lastLine, option)

	#
	# コメント形式を得る
	#
	def getCommentStyle(self, lineNum, line):
		return {'head' : ';', 'tail' : ''}

	#
	# 実行動作を行う
	#
	def make(self):
		vim.command('silent !explorer "C:\Program Files\AutoHotkey\AutoHotKeyU64.exe"')

	#
	# テストを実行する
	#
	def test(self):
		pass

	#
	# ログ文を得る
	#
	def getLogText(self):
		pass

EOM
