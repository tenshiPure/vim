python <<EOM
# -*- coding: utf-8 -*-

class ParamAnalysis:

	#
	# 翻訳元言語を取得する
	#
	@staticmethod
	def getFrom():
		return 'ja'

	#
	# 翻訳先言語を取得する
	#
	@staticmethod
	def getTo():
		return 'en'

	#
	# 翻訳するテキストを取得する
	#
	@staticmethod
	def getText():
		buf = _Buffer()

		result = buf.lines[1]
		for line in buf.lines[2:]:
			result = result + '+' + line

		return result.decode('cp932').encode('utf-8')

EOM
