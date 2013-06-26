python <<EOM

class css(Base):

	#
	# コンストラクタ
	#
	def __init__(self, behavior, firstLine, lastLine, fileName):
		Base.__init__(self, behavior, firstLine, lastLine, fileName)

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

EOM
