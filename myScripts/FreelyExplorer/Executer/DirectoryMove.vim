"FreelyExplorer

"DirectoryMove.vim
"Vim �̍�ƃf�B���N�g����ύX����

function! DirectoryMove(mode, full_path)

	if a:mode == 'move'
		execute 'cd ' . a:full_path

	elseif a:mode == 'move_back'
		execute 'cd -'
	
	endif

	"FreelyExplorer �Ɉ����n��
	call FreelyExplorer(getcwd())

endfunction

