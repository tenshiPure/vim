"FlexibleComment

"Delete_tpl.vim
"指定の１行のコメント削除 (tpl)

function! Delete_tpl(current_line_num)

	"削除して良い行か判定
	if Delete_Check_tpl(getline(a:current_line_num)) == -1
		return -1
	endif


	"コメント記号が最初に現れる桁数
	let comment_mark_pos = match(getline(a:current_line_num), "{")

	"カーソルを行へ移動
	execute "call cursor(a:current_line_num, 0)"
	
	"カーソルを行頭へ移動
	execute ":normal 0"

	"カーソルをコメント記号に合わせる
	let index = 0
	while index < comment_mark_pos
		"カーソルを右へ...
		execute ":normal l"
		let index = index + 1
	endwhile

	"削除
	execute ":normal xxx"

	"削除
	execute ":normal A"
	execute ":normal xxx"

	return 0

endfunction

"コメント行判定
function! Delete_Check_tpl(current_line)

	"行頭にコメント記号が存在するか判断する
	let result = match(a:current_line, "\{\\* .* \\*\}")

	return result

endfunction
