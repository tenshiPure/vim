python <<EOM
# -*- coding: utf-8 -*-

class ResultOutputer:

	#
	# ���ʂ��o�͂���
	#
	@staticmethod
	def toBuffer(text):
		Tab.switchTab(en_trs, 2)

		text = text.decode('utf-8').encode('cp932')

		buf = _Buffer()
		buf.write(1, text)

EOM
