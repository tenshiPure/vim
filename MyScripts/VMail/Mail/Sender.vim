python <<EOM
# -*- coding:utf-8 -*-

class Sender:

	WIDTH_LIMIT = 30

	#
	# コンストラクタ
	#
	def __init__(self, originData):
		try:
			decodefrag = email.Header.decode_header(originData)
			
			_sender = ''
			for string, encoding in decodefrag:
				if encoding is None:
					_sender += unicode(string)
				else:
					_sender += unicode(string, encoding)
		
			_sender = String.convert(_sender, None, 'vim')

			_name = String.lenAdjust(parseaddr(_sender)[0], Sender.WIDTH_LIMIT, ' ')
			_addr = String.lenAdjust(parseaddr(_sender)[1], Sender.WIDTH_LIMIT, ' ')

			self.simple = _name if parseaddr(_sender)[0] != '' else _addr
			self.detail = '%s %s' % (parseaddr(_sender)[0], parseaddr(_sender)[1])

		except:
			self.simple = String.lenAdjust(AnalysisException.ANALYSIS_FAILURE, Sender.WIDTH_LIMIT, ' ')
			self.detail = AnalysisException.ANALYSIS_FAILURE

	#
	# ダンプ
	#
	def dump(self):
		print '-sender-'
		print self.simple
		print self.detail
		print ' '

EOM
