"ReloadVimrc.vim

"EnvMarkReplace.vim
"環境マークをif構文に置換する

function! EnvMarkReplace(from_file, to_file)

	"書き込み対象を一度全消去する
	execute ":redir! > " . a:to_file
		silent! echon ""
	redir END

	"読み込みファイルの各行をリストとして取得し、１行ループ
	for line in readfile(a:from_file)

		"--os の形を探す
		let mark = matchstr(line, "--win\\|--mac")

		"-- を落とす
		let env = substitute(mark, "--", "", "g")

		"マークが検出されなかった
		if env == ""
			let head = ""
			let foot = ""

		"マークが検出された
		else
			let head = "\n" . "if os == " . "'" . env . "'"
			let foot = "\n" . "endif"
			let line = "\t" . substitute(line, mark, "", "g")
		end

		"ファイルに書き出し（既存の内容にループ内で作成した複数行を上書き）
		execute ":redir! >> " . a:to_file

			"if os == 'win|mac'　（未検出時は空文字）
			silent! echon head

			"本体行　（未検出時は未編集）
			silent! echo line

			"endif　（未検出時は空文字）
			silent! echon foot

		redir END

	endfor

endfunction

