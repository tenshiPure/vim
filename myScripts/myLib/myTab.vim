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
		


	openWorkingText = staticmethod(openWorkingText)
	isBlankTab = staticmethod(isBlankTab)
	closeWorkingText = staticmethod(closeWorkingText)
	clearCurrentBuffer = staticmethod(clearCurrentBuffer)
EOM
