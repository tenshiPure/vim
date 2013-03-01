"FlexibleFolding

"FlexibleFolding.vim
"拡張子に適した折り畳みを管理する

"関連ファイルの読み込み
"source $myScripts/FlexibleComment/IsBlankLine.vim

function! FlexibleFolding()

	echo 'folding'

endfunction

"nnoremap <F3> :call FlexibleFolding()<CR>


function! MyFoldText()

	"開始行の文字列
	let first_line = getline(v:foldstart)
	"
	"タブが空白文字になってしまうので、タブ１をスペース４に置換（tabstop）
	let first_line = substitute(first_line, "\\t", '    ', 'g')
	"
	"終了行の文字列
	let last_line = getline(v:foldend)

	"終了行の空白文字は消去する
	let last_line = substitute(last_line, "\\t", '', 'g')

	"閉じたときに表示される文字列
	return first_line . ' ... ' . last_line

endfunction
