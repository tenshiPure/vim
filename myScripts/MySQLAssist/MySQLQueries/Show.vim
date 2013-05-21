python <<EOM

class Show:

	bufName = ''
	header = []
	loginCommand = ''
	command = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, bufName, loginCommand):
		self.bufName = bufName
		self.header = self.initWorkingText()
		self.loginCommand = loginCommand
		self.command = self.createCommand()

	#
	# テキストの初期化
	#
	def initWorkingText(self):
		tmp = []
		tmp.append('----------------------')
		tmp.append('MySQLAssist ShowResult')
		tmp.append('----------------------')
		
		return tmp

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
		myTab.switchTab(self.bufName, 3)
		myTab.initWorkingText(self.header)
		myCursor.moveCursolBottom(1)
		vim.command('r' + self.command)
		del vim.current.buffer[4]

EOM
