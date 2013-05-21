python <<EOM

class LoginInfo:

	user = ''
	pswd = ''
	db = ''
	loginCommand = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, user, pswd, db):
		self.user = user
		self.pswd = pswd
		self.db = db
		self.loginCommand = self.createLoginCommand()

	#
	# ログイン部のコマンドを作成する
	#
	def createLoginCommand(self):
		return '!mysql -u %(user)s -p%(pswd)s %(db)s -e ' % {'user' : self.user, 'pswd' : self.pswd, 'db' : self.db}
		

EOM
