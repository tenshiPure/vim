python <<EOM

import vim

class MyTab:

	#
	# 無題のタブか判定
	#
	@staticmethod
	def isBlankTab():
		return len(vim.current.buffer) == 1 and vim.current.buffer[0] == ''

	#
	# タブを切り替える
	#
	@staticmethod
	def switchTab(target, tryCount):
		for count in range(tryCount):
			if vim.current.buffer.name != target:
				vim.command('execute ":normal gw"')

	#
	# 複数のタブを展開する：逆Ｔ字
	#
	@staticmethod
	def expandReverseT(buf1, buf2, buf3, height):
		if MyTab.isBlankTab():
			vim.command('edit ' + buf2)
		else:
			vim.command('tabedit ' + buf2)
		vim.command('vsplit ' + buf1)
		vim.command('botright ' + str(height) + 'split ' + buf3)

EOM
