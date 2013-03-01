"FlexibleComment

"Switch_sh.vim
"指定の１行のコメントを逆転 (sh)

function! Switch_sh(current_line_num)

	"コメント消去を試みる
	let result = Delete_sh(a:current_line_num)

	"コメント消去をしていなければ、コメント追加
	if result == -1
		let result = Add_sh(a:current_line_num)
	endif

endfunction
