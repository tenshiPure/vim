"FreelyExplorer

"OsExplorer.vim
"OS �̃G�N�X�v���[���ŊJ��

function! OsExplorer(full_path)
		
	if has('win32')
		execute 'silent !explorer ' . a:full_path

	elseif has('mac')
		execute 'silent !open ' . a:full_path

	endif

endfunction
