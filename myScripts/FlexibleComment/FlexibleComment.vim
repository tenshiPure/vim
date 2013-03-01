"FlexibleComment

"FlexibleComment.vim
"モードと拡張子に適したコメント処理を行わせる

"関連ファイルの読み込み
source $myScripts/FlexibleComment/IsBlankLine.vim

function! FlexibleComment(mode) range

	"カレントファイルの拡張子の取得"
	let extension = expand("%:e")

	"とりあえずの対処（tpl -> html）
	if extension == 'tpl'
		let extension = 'html'
	endif
	if extension == 'css'
		let extension = 'php'
	endif

	"動的パス作成と、読み込み (if文を避け、全モードのファイルを読み込む）
	let $add_exe    = extension . '/' . "Add_" . extension . ".vim"
	let $delete_exe = extension . '/' . "Delete_" . extension . ".vim"
	let $switch_exe = extension . '/' . "Switch_" . extension . ".vim"
	source $myScripts/FlexibleComment/extensions/$add_exe
	source $myScripts/FlexibleComment/extensions/$delete_exe
	source $myScripts/FlexibleComment/extensions/$switch_exe

	"指定範囲間で１行ずつループ
	for current_line_num in range(a:firstline, a:lastline)
		execute "call " . a:mode . "_" . extension . "(current_line_num)"
	endfor
	
endfunction
