python <<EOM
# -*- coding: utf-8 -*-

class ResultOutputer:

	#
	# バッファに結果を出力する
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

		text = String.convert(text, 'utf-8', 'vim')

		Tab.switchTab(toBuf, 2)
		buf.clear()
		buf.write(1, text)
		Tab.switchTab(fromBuf, 2)

	#
	# コマンドラインエリアに結果を出力する
	#
	@staticmethod
	def toCommandLineArea(text):
		print String.convert(text, 'utf-8', 'vim')

EOM
