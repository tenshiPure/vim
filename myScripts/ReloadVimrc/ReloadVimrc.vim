"ReloadVimrc.vim

"ReloadVimrc.vim
"vimrc の環境判定の可視性を上げる

"関連ファイルの読み込み
source $myScripts/ReloadVimrc/EnvMarkReplace.vim

function! ReloadVimrc()
	
	"vimrc の環境マークをif構文に置換する
	let from_file = $share . '/vim/vimrc_non_replace.vim'
	let to_file   = $share . '/vim/vimrc_replaced.vim'
	call EnvMarkReplace(from_file, to_file)

endfunction

