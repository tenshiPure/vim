"FlexibleComment

"Switch_tpl.vim
"指定の１行のコメントを逆転 (tpl)

function! Switch_tpl(current_line_num)

	"コメント消去を試みる
	let result = Delete_tpl(a:current_line_num)

	"コメント消去をしていなければ、コメント追加
	if result == -1
		let result = Add_tpl(a:current_line_num)
	endif

endfunction
