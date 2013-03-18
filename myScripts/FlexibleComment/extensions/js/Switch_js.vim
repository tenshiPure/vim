"FlexibleComment

"Switch_js.vim
"指定の１行のコメントを逆転 (js)

function! Switch_js(current_line_num)

	"コメント消去を試みる
	let result = Delete_js(a:current_line_num)

	"コメント消去をしていなければ、コメント追加
	if result == -1
		let result = Add_js(a:current_line_num)
	endif

endfunction
