python <<EOM
import vim

class TabCloser:

	targetBufNum  = 0
	targetBufName = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self):
		self.targetBufNum  = int(vim.eval('tabpagenr()'))
		self.targetBufName = vim.current.buffer.name

	#
	# コントローラから呼ばれるメソッド
	#
	def execute(self):
		self.close()
		self.moveLeftTab()

	#
	# 強制的に閉じるタブか判定
	#
	def isForce(self):
		if self.targetBufName is None:
			return False
		else:
			return self.targetBufName.find("WorkingText") != -1
		
	#
	# タブを閉じる
	#
	def close(self):
		if self.isForce():
			vim.command('execute "bdelete!"')
		else:
			vim.command('execute "bdelete"')
	
	#
	# 左のタブへ移る
	#
	def moveLeftTab(self):
		myScripts = vim.eval('$myScripts')
		frank1 = myScripts + os.sep + 'FlexibleFrank' + os.sep + 'WorkingText.frank'
		frank2 = myScripts + os.sep + 'FlexibleFrank' + os.sep + 'MoreWorkingText.frank'

		if vim.current.buffer.name == frank1:
			self.close()
		elif vim.current.buffer.name == frank2:
			self.close()

		if int(vim.eval('tabpagenr()')) != self.targetBufNum - 1:
			vim.command('execute ":normal gT"')
EOM
