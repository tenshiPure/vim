python <<EOM

class NotMatchEntryNumbersException():

	message = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, command):
		self.message = '[%(command)s] Error : not match numbers before and after.' % locals()

	#
	# エラーメッセージを表示
	#
	def showMessage(self):
		print self.message

EOM
