python <<EOM
import vim

class WordYank:

	#
	# 擬似コンストラクタ
	#
	def __init__(self):
		pass

	#
	# コントローラから呼ばれるメソッド
	#
	def execute(self):
		cursor = MyCursor()
		cursor.storePos()

		self.yankUnderCursor()

		cursor.setPosAtStored()

	#
	# カーソル下の単語をヤンク
	#
	def yankUnderCursor(self):
		vim.command('execute ":normal viwy"')

EOM
