python <<EOM

import vim

class MyTab:

	#
	# 無題のタブか判定
	#
	@staticmethod
	def isBlankTab():
		buf = vim.current.buffer

		length = len(buf)
		oneLine = buf[0]

		return length == 1 and oneLine == ''

	#
	# カレントバッファを空にする
	#
	@staticmethod
	def clearCurrentBuffer():
		vim.current.buffer[:] = None

	#
	# 作業テキストの初期化
	#
	@staticmethod
	def initWorkingText(header):
		buf = vim.current.buffer

		buf[:] = None

		for line in header:
			buf.append(line)

		del buf[0]

	#
	# ウィンドウを切り替える
	#
	@staticmethod
	def changeWindow():
		vim.command('execute ":normal gw"')

	#
	# タブを切り替える
	#
	@staticmethod
	def switchTab(target, tryCount):
		for count in range(tryCount):
			if vim.current.buffer.name != target:
				MyTab.changeWindow()

	#
	# 複数のタブを展開する：逆Ｔ字
	#
	@staticmethod
	def ExpandReverseT(buf1, buf2, buf3, height):
		if MyTab.isBlankTab():
			vim.command('edit ' + buf1)
		else:
			vim.command('tabedit ' + buf1)
		vim.command('vsplit ' + buf2)
		vim.command('botright ' + str(height) + 'split ' + buf3)

EOM
