"FreelyExplorer

"Analyzer/GetFilename.vim
"ファイル名を取得

function! GetFilename()
	
	return substitute(getline("."), "^\t*", "", "g")

endfunction
