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

EOM
