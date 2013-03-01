"FreelyExplorer

"DirectoryMove.vim
"Vim の作業ディレクトリを変更する

function! DirectoryMove(mode, full_path)

	if a:mode == 'move'
		execute 'cd ' . a:full_path

	elseif a:mode == 'move_back'
		execute 'cd -'
	
	endif

	"FreelyExplorer に引き渡し
	call FreelyExplorer(getcwd())

endfunction

