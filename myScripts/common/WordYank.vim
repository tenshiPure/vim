"WordYank.vim

"WordYank.vim
"カーソル位置を変えない単語コピー

function! WordYank()

	"呼び出し時の座標を覚える
	let pos = getpos(".")

	"単語コピー
	execute ":normal viwy"

	"カーソルを戻す
	call setpos(".", pos)

endfunction
