python <<EOM
import re

class GrepEntry(BaseEntry):

	#
	# �R���X�g���N�^
	#
	def __init__(self, head, fullPath):
		BaseEntry.__init__(self, head, fullPath)

	#
	# �o�̓t�H�[�}�b�g
	#
	def createFormatedForOutput(self):
		point = '*' if self.pointed else ''
		tab = '\t' * self.depth
		space = ' ' if self.isDir else ''

		return point + tab + self.entryName + space

EOM
