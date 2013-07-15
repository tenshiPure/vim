python <<EOM
# -*- coding: utf-8 -*-

class ParamAnalysis:

	#
	# 翻訳元言語を取得する
	#
	@staticmethod
	def getFrom():
		buf = _Buffer()

		if buf.name == ja_trs:
			return 'ja'
		else:
			return 'en'

	#
	# 翻訳先言語を取得する
	#
	@staticmethod
	def getTo():
		buf = _Buffer()

		if buf.name == ja_trs:
			return 'en'
		else:
			return 'ja'

	#
	# バッファから翻訳するテキストを取得する
	#
	@staticmethod
	def getTextFromBuffer():
		buf = _Buffer()

		result = buf.lines[1]
		for line in buf.lines[2:]:
			result = result + '+' + line

		return String.convert(result, 'vim', 'utf-8')

EOM
