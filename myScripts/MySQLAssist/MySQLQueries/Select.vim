python <<EOM

class Select:

	bufName = ''
	header = []
	loginCommand = ''
	table = ''
	column = ''
	command = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, bufName, loginCommand, table):
		self.bufName = bufName
		self.header = self.initWorkingText()
		self.loginCommand = loginCommand
		self.table = table
		self.column = self.getColumns()
		self.command = self.createCommand()

	#
	# テキストの初期化
	#
	def initWorkingText(self):
		tmp = []
		tmp.append('------------------------')
		tmp.append('MySQLAssist SelectResult')
		tmp.append('------------------------')
		
		return tmp

	#
	# カラムを取得
	#
	def getColumns(self):
		return '*'

	#
	# コマンド作成
	#
	def createCommand(self):
		query = myString.surround('select %(column)s from %(table)s;' % {'column' : self.column, 'table' : self.table}, '"')
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
