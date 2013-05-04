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
		myScripts = vim.eval('$myScripts')
		frank1 = myScripts + os.sep + 'FlexibleFrank' + os.sep + 'WorkingText.frank'
		frank2 = myScripts + os.sep + 'FlexibleFrank' + os.sep + 'MoreWorkingText.frank'

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

	#
	# フランク１か判定する
	#
	def isFrank1():
		myScripts = vim.eval('$myScripts')
		frank1 = myScripts + os.sep + 'FlexibleFrank' + os.sep + 'WorkingText.frank'

		if vim.current.buffer.name == frank1:
			return True

		return False

	#
	# フランク２か判定する
	#
	def isFrank2():
		myScripts = vim.eval('$myScripts')
		frank2 = myScripts + os.sep + 'FlexibleFrank' + os.sep + 'MoreWorkingText.frank'

		if vim.current.buffer.name == frank2:
			return True

		return False

	openWorkingText = staticmethod(openWorkingText)
	openMoreWorkingText = staticmethod(openMoreWorkingText)
	isBlankTab = staticmethod(isBlankTab)
	closeWorkingTexts = staticmethod(closeWorkingTexts)
	clearCurrentBuffer = staticmethod(clearCurrentBuffer)
	changeWindow = staticmethod(changeWindow)
	isFrank1 = staticmethod(isFrank1)
	isFrank2 = staticmethod(isFrank2)
EOM
