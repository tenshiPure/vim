python <<EOM

class MyCursor:

	#
	# カーソル位置を記憶
	#
	@staticmethod
	def getPos():
		bufnum, lnum, col, off = vim.eval('getpos(".")')
		return (bufnum, lnum, col, off)

	#
	# カーソルを移動
	#
	@staticmethod
	def setPos(pos):
		vim.command('call cursor(%s, %s, %s)' % (pos[1], pos[2], pos[3]))

	#
	# カーソルが何行目にあるか取得
	#
	@staticmethod
	def getCursorLineNum():
		pos = MyCursor.getPos()
		return int(pos[1])

EOM
