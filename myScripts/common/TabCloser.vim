"TabCloser.vim

"TabCloser.vim
"�^�u�ƃo�b�t�@�𓯎��ɕ��A���̃^�u���A�N�e�B�u�ɂ���

function! TabCloser(buf_name, flag)

	let flag = a:flag

	"����o�b�t�@�̊g���q
	let extension = matchstr(a:buf_name, '\..\+$')

	"�C�ӂ̃t�@�C���́A�����t���O�����Ă�
	if extension == '.fe' || extension == '.me'
		let flag = '!'
	endif

	"����o�b�t�@�̃^�u�ԍ�
	let delete_buf_num = tabpagenr()

	"�o�b�t�@�����
	if flag == '!'
		execute 'bdelete! ' . a:buf_name
	else
		execute 'bdelete ' . a:buf_name
	endif

	"����F�����o�b�t�@�����[�ł͂Ȃ�
	if delete_buf_num != 1

		"�J�����g�^�u�̔ԍ�
		let current_buf_num = tabpagenr()

		"�����o�b�t�@�̈���ɂȂ�܂ŁA�^�u��؂�ւ���
		while current_buf_num != delete_buf_num - 1
			execute ':normal gt'
			let current_buf_num = tabpagenr()
		endwhile

	endif
endfunction
