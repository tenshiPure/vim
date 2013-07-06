python <<EOM
# -*- coding: utf-8 -*-

class ParamAnalysis:

	#
	# –|–óŒ³Œ¾Œê‚ðŽæ“¾‚·‚é
	#
	@staticmethod
	def getFrom():
		buf = _Buffer()

		if buf.name == ja_trs:
			return 'ja'
		else:
			return 'en'

	#
	# –|–óæŒ¾Œê‚ðŽæ“¾‚·‚é
	#
	@staticmethod
	def getTo():
		buf = _Buffer()

		if buf.name == ja_trs:
			return 'en'
		else:
			return 'ja'

	#
	# –|–ó‚·‚éƒeƒLƒXƒg‚ðŽæ“¾‚·‚é
	#
	@staticmethod
	def getText():
		buf = _Buffer()

		result = buf.lines[1]
		for line in buf.lines[2:]:
			result = result + '+' + line

		return result.decode('cp932').encode('utf-8')

EOM
