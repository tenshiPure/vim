python <<EOM

class vim_eo(Base):

	#
	# コンストラクタ
	#
	def __init__(self, behavior, firstLine, lastLine, option):
		Base.__init__(self, behavior, firstLine, lastLine, option)

	#
	# コメント形式を得る
	#
	def getCommentStyle(self, lineNum, line):
		if line == 'python <<EOM' or line == 'EOM':
			return {'head' : '"', 'tail' : ''}

		buf = vim.current.buffer

		for index in range(lineNum - 1, -1, -1):
			if buf[index] == 'python <<EOM' or buf[index] == '"python <<EOM':
				return {'head' : '#', 'tail' : ''}
			elif buf[index] == 'EOM' or buf[index] == '"EOM':
				break

		return {'head' : '"', 'tail' : ''}

	#
	# 実行動作を行う
	#
	def make(self):
		buf = _Buffer()
		buf.debug()

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
