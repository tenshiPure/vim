python <<EOM

class Show:

	bufName = ''
	loginCommand = ''
	command = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, bufName, loginCommand):
		self.bufName = bufName
		self.loginCommand = loginCommand
		self.command = self.createCommand()

	#
	# コマンド作成
	#
	def createCommand(self):
		query = myString.surround('show tables;', '"')
		return self.loginCommand + query

	#
	# 実行
	#
	def output(self):
		vim.command('r' + self.command)

EOM
