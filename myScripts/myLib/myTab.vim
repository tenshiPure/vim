python <<EOM

import vim

class myTab:

	#
	# 新規作業バッファを開く
	#
	def openWorkingText(path):
		if myTab.isBlankTab():
			vim.command('edit ' + path)
		else:
			vim.command('tabedit ' + path)
		
	#
	# ２つめの作業バッファを開く
	#
	def openMoreWorkingText(path):
		vim.command('set splitbelow')
		vim.command('split ' + path)
		
	#
	# 無題のタブか判定
	#
	def isBlankTab():
		buf = vim.current.buffer

		length = len(buf)
		oneLine = buf[0]

		return length == 1 and oneLine == ''

	#
	# 作業バッファを閉じる
	#
	def closeWorkingText():
		isWorkingText = vim.current.buffer.name.find('WorkingText.frank') != -1

		if isWorkingText:
			vim.command('bdelete!')

	#
	# カレントバッファを空にする
	#
	def clearCurrentBuffer():
		vim.current.buffer[:] = None
		
	#
	# ウィンドウを切り替える
	#
	def changeWindow():
		vim.command('execute ":normal gw"')

	openWorkingText = staticmethod(openWorkingText)
	openMoreWorkingText = staticmethod(openMoreWorkingText)
	isBlankTab = staticmethod(isBlankTab)
	closeWorkingText = staticmethod(closeWorkingText)
	clearCurrentBuffer = staticmethod(clearCurrentBuffer)
	changeWindow = staticmethod(changeWindow)
EOM
