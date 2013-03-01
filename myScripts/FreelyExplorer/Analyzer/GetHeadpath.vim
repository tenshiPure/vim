"FreelyExplorer

"Analyzer/GetHeadpath.vim
"ファイル名のヘッダ部パスを取得

function! GetHeadpath()

	"リスト変数
	let result_list = []
	
	"カーソルがある行で開始
	let current_line = getpos(".")[1]
	"カーソルがある行のタブ数
	let current_line_tab_count = GetTabCount(getpos(".")[1])

	"探すタブ数
	let target_tab_count = current_line_tab_count - 1

	"行をさかのぼり、一階層ずつ辿る
	while current_line_tab_count != 0
		
		"前ループで使用した行数
		let prev_line = current_line
		"前ループで使用した行のタブ数
		let prev_line_tab_count = current_line_tab_count

		"今ループで使用する行数
		let current_line = current_line - 1
		"今ループで使用する行のタブ数
		let current_line_tab_count = GetTabCount(current_line)


		"今ループで取得したタブ数が探しているタブ数である
		if target_tab_count == current_line_tab_count

			"親ディレクトリをリストの先頭に追加
			call insert(result_list, getline(current_line), 0)

			"探すタブ数を１減らす（一階層あがる）
			let target_tab_count = target_tab_count - 1

		endif

	endwhile

	"リスト要素からタブを落として、文字列連結する
	return ListToString(result_list)

endfunction
