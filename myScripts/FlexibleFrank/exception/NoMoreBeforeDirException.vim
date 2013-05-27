python <<EOM

class NoMoreBeforeDirException():

	message = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, command):
		self.message = '[%(command)s] Error : no more before dir.' % locals()

	#
	# エラーメッセージを表示
	#
	def showMessage(self):
		print self.message

EOM
