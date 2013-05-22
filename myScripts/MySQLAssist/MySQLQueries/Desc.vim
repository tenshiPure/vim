python <<EOM

class Desc:

	bufName = ''
	header = []
	loginCommand = ''
	table = ''
	command = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, bufName, loginCommand, table):
		self.bufName = bufName
		self.header = self.initWorkingText()
		self.loginCommand = loginCommand
		self.table = table
		self.command = self.createCommand()

	#
	# テキストの初期化
	#
	def initWorkingText(self):
		tmp = []
		tmp.append('----------------------')
		tmp.append('MySQLAssist DescResult')
		tmp.append('----------------------')
		
		return tmp

	#
	# コマンド作成
	#
	def createCommand(self):
		query = myString.surround('desc %(table)s;' % {'table' : self.table}, '"')
		return self.loginCommand + query

	#
	# 実行
	#
	def output(self):
		myTab.switchTab(self.bufName, 3)
		myTab.initWorkingText(self.header)
		MyCursor.moveCursorBottom(1)
		vim.command('r' + self.command)
		del vim.current.buffer[4]

EOM
