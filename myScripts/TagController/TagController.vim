"TagController.vim

"TagController.vim
"タグジャンプの拡張

"関連ファイルの読み込み
"source $myScripts/TagController/EnvMarkReplace.vim

function! TagController(command)

	if a:command == 'v'

		"同じファイルを縦分割で開く
		execute ":normal \<C-w>v"

		"開いたウィンドウに移動する
		execute ":normal \<C-w>w"

		"Tag で開く
		execute ":normal \<C-]>"
	endif

	if a:command == 's'

		"同じファイルを縦分割で開く
		execute ":normal \<C-w>s"

		"開いたウィンドウに移動する
		execute ":normal \<C-w>w"

		"Tag で開く
		execute ":normal \<C-]>"
	endif

	if a:command == 't'

		"カーソル下の単語を展開
		let cword = expand('<cword>')

		"参照先を新規タブで開く
		execute "tab stj " . cword

	endif

	if a:command == 'o'

		let buf_num = tabpagenr()
		echo buf_num
	endif

endfunction
