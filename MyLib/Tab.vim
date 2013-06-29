python <<EOM

class Tab:

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
		if Tab.isBlankTab():
			vim.command('edit ' + buf2)
		else:
			vim.command('tabedit ' + buf2)
		vim.command('vsplit ' + buf1)
		vim.command('botright ' + str(height) + 'split ' + buf3)

	#
	# タブを閉じる
	#
	@staticmethod
	def close():
		forceList = ['frank', 'cass']

		extension = File.getExtension(vim.current.buffer.name)
		
		if extension in forceList:
			while extension in forceList:
				vim.command('bdelete!')
				extension = File.getExtension(vim.current.buffer.name)
		else:
			vim.command('bdelete')

EOM
