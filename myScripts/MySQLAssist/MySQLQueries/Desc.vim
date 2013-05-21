python <<EOM

class Desc:

	bufName = ''
	loginCommand = ''
	table = ''
	command = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, bufName, loginCommand):
		self.bufName = bufName
		self.loginCommand = loginCommand
		self.table = self.getTableName()
		self.command = self.createCommand()

	#
	# テーブル名を取得
	#
	def getTableName(self):
#		table = vim.eval("expand('<cword>')")
#		return 'SLFDocumentMngInfo'
		return 'book'

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
		myCursor.moveCursolBottom(1)
		vim.command('r' + self.command)

EOM
