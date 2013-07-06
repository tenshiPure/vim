python <<EOM
# -*- coding: utf-8 -*-

class ResultOutputer:

	#
	# Œ‹‰Ê‚ðo—Í‚·‚é
	#
	@staticmethod
	def toBuffer(text):
		buf = _Buffer()

		if buf.name == ja_trs:
			fromBuf = ja_trs
			toBuf = en_trs
		else:
			fromBuf = en_trs
			toBuf = ja_trs

		text = text.decode('utf-8').encode('cp932')

		Tab.switchTab(toBuf, 2)
		buf.write(1, text)
		Tab.switchTab(fromBuf, 2)
EOM
