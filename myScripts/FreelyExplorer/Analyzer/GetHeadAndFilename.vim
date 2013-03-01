"FreelyExplorer

"Analyzer/GetHeadAndFilename.vim
"カーソル下のフルパスを作成する

function! GetHeadAndFilename()

	"カーソル下のファイル名を取得
	let filename = GetFilename()

	"ファイル名のヘッダ部パスを取得
	let headpath = GetHeadpath()

	"返却
	return headpath . filename

endfunction
