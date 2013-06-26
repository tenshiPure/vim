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
	# ログを吐く文をソースに出力する
	#
	def log(self):
		pass

EOM
