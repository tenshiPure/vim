"FlexibleComment

"Switch_java.vim
"指定の１行のコメントを逆転 (java)

function! Switch_java(current_line_num)

	"コメント消去を試みる
	let result = Delete_java(a:current_line_num)

	"コメント消去をしていなければ、コメント追加
	if result == -1
		let result = Add_java(a:current_line_num)
	endif

endfunction
