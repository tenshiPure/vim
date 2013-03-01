"FreelyExplorer

"Printer/EchoEntries.vim
"取得したエントリを出力

function! EchoEntries(result, head)

	"ヘッダ出力
	call _EchoHeader(a:head)

	"./ ../ 出力
	call _EchoSpDir()

	"キーリストをソートする（大文字小文字は無視）
	let sorted_key_list = sort(keys(a:result), 1)

	"ソートしたキーでまわす
	for key in sorted_key_list

		let tabs = ''

		"キーを出力

		"この階層のファイル./hoge.txt の./ は見せない
		if key == "."
			"noline

		"キーに区切り文字があった場合（win でのvim 置換がうまくいかないので、区切り文字を\ -> / になっている）
		elseif match(key, '/') != -1
			"親階層部分を切り落としたもの
			let head_cut = matchstr(key, '[^\/]\+$')

			"区切り文字の数
			let parser_count = _CountParser(key)

			"区切り文字の数だけインデントする
			let tabs = _MakeTabs(parser_count)

			execute ":normal I" . tabs . head_cut . "\<ENTER>"

		"区切り文字の無いディレクトリは、そのまま出力する
		else
			execute ":normal I\<ENTER>" . key . "\<ENTER>"
		endif




		"キーと対応したリストを一件ずつ出力
		for val in a:result[key]
			execute ":normal I" . tabs . val . "\<ENTER>"
		endfor

	endfor

	"カーソルを一番上へ移動
	execute ":normal gg"

endfunction

function! _EchoHeader(head)

	"ファイルをクリア
	execute ":normal ggVGd"

	"ヘッダ出力
	execute ":normal I----------------------------------------------------------------------\<ENTER>"
	execute ":normal I          " . a:head . "\<ENTER>"
	execute ":normal I----------------------------------------------------------------------\<ENTER>\<ENTER>"

endfunction

function! _EchoSpDir()

	execute ":normal I./\<ENTER>\<ENTER>"
	execute ":normal I../\<ENTER>\<ENTER>"
	execute ":normal I-\<ENTER>\<ENTER>"

endfunction

function! _CountParser(key)

	"区切り文字のカウント変数
	let p_count = 0

	let len = strlen(a:key)
	let i = 0
	while i < len

		"区切り文字を検出したら
		if a:key[i] == '/'
			"カウント増
			let p_count = p_count + 1
		endif
		
		let i = i + 1

	endwhile

	return p_count

endfunction

function! _MakeTabs(num)

	let tabs = ''

	let i = 0
	while i < a:num
		let tabs = tabs . "\t"
		let i = i + 1
	endwhile

	return tabs

endfunction
