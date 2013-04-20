python <<EOM

class myTab:

	#
	# 強制的に閉じるタブか判定
	#
	def isForce(target_buf_name):
		if target_buf_name is None:
			return False
		else:
			return target_buf_name.find("Working_Text") != -1
		
	#
	# タブを閉じる
	#
	def close(target_buf_name):
		if myTab.isForce(target_buf_name):
			vim.command('execute "bdelete!"')
		else:
			vim.command('execute "bdelete"')
	
	#
	# 左のタブへ移る
	#
	def moveLeftTab(target_buf_num):
		if int(vim.eval('tabpagenr()')) != target_buf_num - 1:
			vim.command('execute ":normal gT"')

	isForce = staticmethod(isForce)
	close = staticmethod(close)
	moveLeftTab = staticmethod(moveLeftTab)
EOM
