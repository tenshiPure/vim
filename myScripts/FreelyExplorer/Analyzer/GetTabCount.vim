"FreelyExplorer

"Analyzer/GetTabCount.vim
"指定行のタブ数を数える

function! GetTabCount(target_line)

	"指定行でタブを検索、一致部分を得る
	let tab = matchstr(getline(a:target_line), "\t*")

	"タブ部分の文字数を数えて返却
	return len(tab)

endfunction
