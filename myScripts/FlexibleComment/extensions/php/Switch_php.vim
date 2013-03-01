"FlexibleComment

"Switch_php.vim
"指定の１行のコメントを逆転 (php)

function! Switch_php(current_line_num)

	"コメント消去を試みる
	let result = Delete_php(a:current_line_num)

	"コメント消去をしていなければ、コメント追加
	if result == -1
		let result = Add_php(a:current_line_num)
	endif

endfunction
