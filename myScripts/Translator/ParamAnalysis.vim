python <<EOM
# -*- coding: utf-8 -*-

class ParamAnalysis:

	#
	# �|�󌳌�����擾����
	#
	@staticmethod
	def getFrom():
		buf = _Buffer()

		if buf.name == ja_trs:
			return 'ja'
		else:
			return 'en'

	#
	# �|��挾����擾����
	#
	@staticmethod
	def getTo():
		buf = _Buffer()

		if buf.name == ja_trs:
			return 'en'
		else:
			return 'ja'

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
