python <<EOM

class DestinationNotDirException():

	message = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, command):
		self.message = '[%(command)s] Error : destination must be dir.' % locals()

	#
	# エラーメッセージを表示
	#
	def showMessage(self):
		print self.message

EOM
