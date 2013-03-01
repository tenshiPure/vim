"FlexibleComment

"Switch_vim.vim
"指定の１行のコメントを逆転 (vim)

function! Switch_vim(current_line_num)

	"コメント消去を試みる
	let result = Delete_vim(a:current_line_num)

	"コメント消去をしていなければ、コメント追加
	if result == -1
		let result = Add_vim(a:current_line_num)
	endif

endfunction
