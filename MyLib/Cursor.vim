python <<EOM

class Cursor:

	#
	# カーソル位置を取得
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
		pos = Cursor.getPos()
		return int(pos[1])

	#
	# カーソルが何列目にあるか取得
	#
	@staticmethod
	def getCursorColumnNum():
		pos = Cursor.getPos()
		return int(pos[2])

EOM
