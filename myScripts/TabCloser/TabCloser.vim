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
		myTab.close(self.target_buf_name)
		myTab.moveLeftTab(self.target_buf_num)

EOM
