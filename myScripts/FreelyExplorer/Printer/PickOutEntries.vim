"FreelyExplorer

"Printer/PickOutEntries.vim
"全エントリを取得

function! PickOutEntries(head)

	let dir_list = GetAllDirectries(a:head)

	let file_dict = {}

	let file_dict = MakeFileDict(dir_list)

	return file_dict

endfunction
