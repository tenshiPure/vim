python <<EOM
import vim

class WordYank:

	#
	# コントローラから呼ばれるメソッド
	#
	def execute(self):
		pos = Cursor.getPos()

		self.yankUnderCursor()

		Cursor.setPos(pos)

	#
	# カーソル下の単語をヤンク
	#
	def yankUnderCursor(self):
		vim.command('execute ":normal viwy"')

EOM
