python <<EOM
import vim

class TabCloser2:

	target_buf_num  = 0
	target_buf_name = ''

	#
	# �[���R���X�g���N�^
	#
	def __init__(self):
		self.target_buf_num  = int(vim.eval('tabpagenr()'))
		self.target_buf_name = vim.current.buffer.name

	#
	# �R���g���[������Ă΂�郁�\�b�h
	#
	def execute(self):
		self.close()
		self.switchTab()

	#
	# �����I�ɕ����ƃt�@�C�����𔻒�
	#
	def isForce(self):
		if self.target_buf_name is None:
			return False
		else:
			return self.target_buf_name.find("Working_Text") != -1
		
	#
	# ������s
	#
	def close(self):
		if self.isForce():
			vim.command('execute "bdelete!"')
		else:
			vim.command('execute "bdelete"')
	
	#
	# ���̃^�u�ֈڂ�
	#
	def switchTab(self):
		if int(vim.eval('tabpagenr()')) != self.target_buf_num - 1:
			vim.command('execute ":normal gT"')
EOM
