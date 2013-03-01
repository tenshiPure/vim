"TabCloser.vim

"TabCloser.vim
"タブとバッファを同時に閉じ、左のタブをアクティブにする

function! TabCloser(buf_name, flag)

	let flag = a:flag

	"閉じるバッファの拡張子
	let extension = matchstr(a:buf_name, '\..\+$')

	"任意のファイルは、強制フラグをたてる
	if extension == '.fe' || extension == '.me'
		let flag = '!'
	endif

	"閉じるバッファのタブ番号
	let delete_buf_num = tabpagenr()

	"バッファを閉じる
	if flag == '!'
		execute 'bdelete! ' . a:buf_name
	else
		execute 'bdelete ' . a:buf_name
	endif

	"判定：閉じたバッファが左端ではない
	if delete_buf_num != 1

		"カレントタブの番号
		let current_buf_num = tabpagenr()

		"閉じたバッファの一つ左になるまで、タブを切り替える
		while current_buf_num != delete_buf_num - 1
			execute ':normal gt'
			let current_buf_num = tabpagenr()
		endwhile

	endif
endfunction
