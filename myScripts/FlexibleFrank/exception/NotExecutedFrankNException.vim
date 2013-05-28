python <<EOM

class NotExecutedFrankNException():

	message = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, command, num):
		self.message = '[%(command)s] Error : command must execute frank%(num)s.' % locals()

	#
	# エラーメッセージを表示
	#
	def showMessage(self):
		print self.message

EOM
