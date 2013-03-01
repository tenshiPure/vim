"FreelyExplorer

"FileOpen.vim
"vim で開く

function! FileOpen(mode, full_path)

	"そのファイルを編集する
	if a:mode == 'edit'

		"作業タブのバッファ名を取得
		let buf_name = expand("%:p")

		"新規タブで開く
		execute ":999tabedit " . a:full_path

		"作業タブを閉じる
		call TabCloser(buf_name, '!')

	"タブで開いて、フォーカスを戻す
	elseif a:mode == 'tabedit'

		"新規タブで開く
		execute ":999tabedit " . a:full_path

		"フォーカスを戻す
		call TabFocus(expand("$myScripts/FreelyExplorer/Printer/Working_Text.fe"))

	endif

endfunction
