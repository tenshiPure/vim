python <<EOM
# -*- coding: utf-8 -*-

class ParamAnalysis:

	#
	# �|�󌳌�����擾����
	#
	@staticmethod
	def getFrom():
		return 'ja'

	#
	# �|��挾����擾����
	#
	@staticmethod
	def getTo():
		return 'en'

	#
	# �|�󂷂�e�L�X�g���擾����
	#
	@staticmethod
	def getText():
		buf = _Buffer()

		result = buf.lines[1]
		for line in buf.lines[2:]:
			result = result + '+' + line

		return result.decode('cp932').encode('utf-8')

EOM
