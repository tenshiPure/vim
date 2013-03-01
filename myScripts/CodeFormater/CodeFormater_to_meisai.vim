"CodeFormater

"CodeFormater.vim
"コードを任意の形式にフォーマットする

"関連ファイルの読み込み
"source $myScripts/FlexibleComment/IsBlankLine.vim

function! CodeFormater(style) range

	"選択範囲を一行ずつ扱う
	for current_line_num in range(a:firstline, a:lastline)

		" { だけの行か判定する
		if match(getline(current_line_num), '^\t*{.*$') != -1

			"その { の直前のキーワードを取得する
			let before_keyword = GetKeyword(current_line_num)

			"キーワードを正常に検出しているなら、
			if before_keyword != ''

				" { をフォーマットする
				call BracketFormat(current_line_num)

				"else の場合は、追加フォーマット
				if before_keyword == 'else'
					
					"else をフォーマットする
					call ElseFormat(current_line_num)

				endif

			endif

		endif

		"tab -> space
		call TabFormat(current_line_num)

	endfor

endfunction


" { の直前に出てくるフォーマット対象のキーワードを返却する
function! GetKeyword(current_line_num)

	let rtn = ''

	"一行上でキーワードを検索する
	let line = getline(a:current_line_num - 1)
	let rtn = matchstr(line, 'if\|else\|for')
	
	return rtn

endfunction


" { をフォーマットする
function! BracketFormat(current_line_num)

	" { のある行の一行上へ移動して、
	call cursor(a:current_line_num - 1, 0)
	"末尾に { を追加
	execute ':normal A {'

	" { のある行へ移動して、
	call cursor(a:current_line_num, 0)
	" { 削除
	execute ':normal dd'

endfunction



"else をフォーマットする
function! ElseFormat(current_line_num)

	" { の一行上のelse のある行の一行上へ移動して、
	call cursor(a:current_line_num - 2, 0)
	"末尾にelse { を追加
	execute ':normal A else {'

	"else {のある行へ移動して、
	call cursor(a:current_line_num - 1, 0)
	"else { 削除
	execute ':normal dd'

endfunction



"Tab をフォーマットする
function! TabFormat(current_line_num)

	"tab -> space
	let formated = substitute(getline(a:current_line_num), '\t', '    ', 'g')

	"置き換え
	call setline(a:current_line_num, formated)

endfunction



vnoremap <F3> :call CodeFormater('meisai')<CR>
