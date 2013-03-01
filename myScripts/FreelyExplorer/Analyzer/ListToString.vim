"FreelyExplorer

"Analyzer/ListToString.vim
"リスト要素からタブを落として、文字列連結する

function! ListToString(list)

	"返却用変数
	let result_str = ""

	"リストをループ
	for dir in a:list

		"タブを落とす
		let dir = substitute(dir, "^\t*", "", "g")
		"文字列連結
		let result_str = result_str . dir . "/"

	endfor

	"返却
	return result_str

endfunction
