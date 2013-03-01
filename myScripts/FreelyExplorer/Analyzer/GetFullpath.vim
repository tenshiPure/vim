"FreelyExplorer

"GetFullPath.vim
"ファイル名とヘッダ部をあわせた物を、フルパスにする

function! GetFullPath(head_and_filename)

	"２行目のヘッドパスを取得
	let head_path = substitute(getline(2), "          ", "", "g")

	"ヘッドパスとカーソル下のディレクトリパス（../ 含む）を連結
	let full_path = head_path . "\\" . a:head_and_filename

	return full_path

endfunction
