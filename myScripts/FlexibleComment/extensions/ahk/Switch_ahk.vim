"FlexibleComment

"Switch_ahk.vim
"指定の１行のコメントを逆転 (ahk)

function! Switch_ahk(current_line_num)

	"コメント消去を試みる
	let result = Delete_ahk(a:current_line_num)

	"コメント消去をしていなければ、コメント追加
	if result == -1
		let result = Add_ahk(a:current_line_num)
	endif

endfunction
