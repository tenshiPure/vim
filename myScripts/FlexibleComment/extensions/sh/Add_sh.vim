"FlexibleComment

"Add_sh.vim
"指定の１行にコメント付与 (sh)

function! Add_sh(current_line_num)

	"空行判定
	if IsBlankLine(getline(a:current_line_num)) == -1
		return
	endif

	"カーソルを行へ移動
	execute "call cursor(a:current_line_num, 0)"

	"行の先頭にコメント記号を挿入
	execute ":normal I" . "#"

	return 0

endfunction
