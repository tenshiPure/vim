python <<EOM
import vim

class WordYank:

	#
	# ヤンク
	#
	def yank(self):
		pos = Cursor.getPos()

		vim.command('execute ":normal viwy"')

		Cursor.setPos(pos)

	#
	# ペースト
	#
	def paste(self):
		vim.command('call Paste()')

EOM

function! Paste()
	execute 'normal! diw"0P'
endfunction
