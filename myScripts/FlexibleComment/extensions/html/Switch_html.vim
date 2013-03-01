"FlexibleComment

"Switch_html.vim
"指定の１行のコメントを逆転 (html)

function! Switch_html(current_line_num)

	"コメント消去を試みる
	let result = Delete_html(a:current_line_num)

	"コメント消去をしていなければ、コメント追加
	if result == -1
		let result = Add_html(a:current_line_num)
	endif

endfunction
