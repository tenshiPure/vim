python <<EOM

class sh(Base):

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
		pass

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
