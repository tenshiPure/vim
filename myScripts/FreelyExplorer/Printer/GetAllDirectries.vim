"FreelyExplorer

"Printer/GetAllDirectries.vim
"全ディレクトリパスを取得

function! GetAllDirectries(head)

	"win でのvim 置換がうまくいかないので、区切り文字を\ -> /
	let replaced_head = substitute(a:head, "\\", "/", "g")

	let dir_list = []

	let all = glob(a:head . "/**")
	let entries = split(all, '\n')

	for entry in entries
		if isdirectory(entry)

			"win でのvim 置換がうまくいかないので、区切り文字を\ -> /
			let entry = substitute(entry, "\\", "/", "g")
			"ヘッド部は削除
			let entry = substitute(entry, replaced_head . "/", "", "g")
			call add(dir_list, entry)

		endif
	endfor

	call add(dir_list, ".")

	return dir_list

endfunction
