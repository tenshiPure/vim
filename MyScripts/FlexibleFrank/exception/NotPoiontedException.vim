python <<EOM

class NotPoiontedException():

	message = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, command):
		self.message = '[%(command)s] Error : target not pointed.' % locals()

	#
	# エラーメッセージを表示
	#
	def showMessage(self):
		print self.message

EOM
