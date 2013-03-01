"FreelyExplorer

"Printer/MakeFileDict.vim
"階層の全ファイルを辞書に追加

function! MakeFileDict(dir_list)

	"返却辞書
	let dict = {}

	"全ディレクトリパスをまわす
	for dir in a:dir_list

		let all = glob(dir . "/*")
		
		let entries = split(all, '\n')

		"ループ内ファイルリスト
		let file_list = []

		"エントリをループし、
		for entry in entries

			if isdirectory(entry)
			"ファイルならば、
			else
				"win でのvim 置換がうまくいかないので、区切り文字を\ -> /
				let entry = substitute(entry, "\\", "/", "g")

				"ヘッダパス部分を落として、
				if dir == "."
					let file_name = substitute(entry, './', "", "g")
				else
					let file_name = substitute(entry, dir . '/', "\\t", "g")
				endif

				"ファイルリストに追加
				call add(file_list, file_name)

			endif

		endfor

		"ファイルのリストを、ディレクトリパスと対にして辞書へ追加
		let dict[dir] = file_list

	endfor

	"辞書返却
	return dict

endfunction
