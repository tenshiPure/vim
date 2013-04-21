python <<EOM
import vim

class TabCloser:

	target_buf_num  = 0
	target_buf_name = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self):
		self.target_buf_num  = int(vim.eval('tabpagenr()'))
		self.target_buf_name = vim.current.buffer.name

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
		if self.target_buf_name is None:
			return False
		else:
			return self.target_buf_name.find("WorkingText") != -1
		
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
		if int(vim.eval('tabpagenr()')) != self.target_buf_num - 1:
			vim.command('execute ":normal gT"')
EOM
