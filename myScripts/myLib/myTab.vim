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
	def closeWorkingTexts():
		frank1 = r'C:\Program Files (x86)\vim\gitvim\myScripts\FlexibleFrank\WorkingText.frank'
		frank2 = r'C:\Program Files (x86)\vim\gitvim\myScripts\FlexibleFrank\MoreWorkingText.frank'

		if vim.current.buffer.name == frank1:
			vim.command('bdelete!')
		elif vim.current.buffer.name == frank2:
			vim.command('bdelete!')

		if vim.current.buffer.name == frank1:
			vim.command('bdelete!')
		elif vim.current.buffer.name == frank2:
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
	closeWorkingTexts = staticmethod(closeWorkingTexts)
	clearCurrentBuffer = staticmethod(clearCurrentBuffer)
	changeWindow = staticmethod(changeWindow)
EOM
