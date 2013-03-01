"common

"TabFocus.vim
"指定ファイルを編集タブにする

function! TabFocus(filename)

	"判定：バッファ内に指定ファイルが存在する
	if bufloaded(a:filename) == 1

		"隠れバッファ、複数起動対策に、一度バッファを落とす
		execute ':bdelete! ' . a:filename
	endif

	"判定：カレントバッファが無題
	if expand("%:p") == ''
		execute ":edit " . a:filename

	else
		execute ":999tabedit " . a:filename

	endif

endfunction
