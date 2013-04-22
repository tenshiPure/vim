python <<EOM
import vim

class myCursor:

	bufnum = 0
	lnum   = 0
	col    = 0
	off    = 0

	#
	# 擬似コンストラクタ
	#
	def __init__(self):
		pass

	#
	# カーソルの位置を記憶
	#
	def storePos(self):
		self.bufnum, self.lnum, self.col, self.off = vim.eval('getpos(".")')

	#
	# 記憶した位置にカーソルを移動
	#
	def setPosAtStored(self):
		self.movePos(self.lnum, self.col, self.off)

	#
	# 任意の位置にカーソルを移動
	#
	def setPosOptional(self, lnum, col, off):
		self.movePos(str(lnum), str(col), str(off))

	#
	# カーソルを移動
	#
	def movePos(self, lnum, col, off):
		vim.command('call cursor(' + lnum + ',' + col + ',' + off + ')')

	#
	# カーソルが何行目にあるか取得
	#
	def getCursolLine(self):
		self.storePos()
		return self.lnum
EOM
