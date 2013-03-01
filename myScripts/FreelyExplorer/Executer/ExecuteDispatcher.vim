"FreelyExplorer

"ExecuteDispatcher.vim
"�f�B���N�g���E�t�@�C���𔻒f���āA�R�}���h��U�蕪����

function! ExecuteDispatcher(attribute)

	"���s�`�F�b�N�ƃt���p�X�̎擾
	let check_return = PreExecute(a:attribute)

	"not execute
	if check_return['exe'] == 'not execute'
		echo ''

	"freely_explorer
	elseif check_return['exe'] == 'freely_explorer'
		call FreelyExplorer(check_return['full_path'])

	"edit
	elseif check_return['exe'] == 'edit'
		call FileOpen('edit', check_return['full_path'])

	"tabedit
	elseif check_return['exe'] == 'tabedit'
		call FileOpen('tabedit', check_return['full_path'])

	"move
	elseif check_return['exe'] == 'move'
		call DirectoryMove('move', check_return['full_path'])

	"move_back
	elseif check_return['exe'] == 'move_back'
		call DirectoryMove('move_back', '')

	"os_explorer
	elseif check_return['exe'] == 'os_explorer'
		call OsExplorer(check_return['full_path'])

	endif
	
endfunction
