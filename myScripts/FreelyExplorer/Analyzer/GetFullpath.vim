"FreelyExplorer

"GetFullPath.vim
"�t�@�C�����ƃw�b�_�������킹�������A�t���p�X�ɂ���

function! GetFullPath(head_and_filename)

	"�Q�s�ڂ̃w�b�h�p�X���擾
	let head_path = substitute(getline(2), "          ", "", "g")

	"�w�b�h�p�X�ƃJ�[�\�����̃f�B���N�g���p�X�i../ �܂ށj��A��
	let full_path = head_path . "\\" . a:head_and_filename

	return full_path

endfunction
