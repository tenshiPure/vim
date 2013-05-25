python <<EOM

class TargetNotFileException():

	message = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, command):
		self.message = '[%(command)s] Error : target must be file.' % locals()

	#
	# エラーメッセージを表示
	#
	def showMessage(self):
		print self.message

EOM
