python <<EOM
# -*- coding:utf-8 -*-

class Sender:

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

			self.name = parseaddr(_sender)[0]
			self.addr = parseaddr(_sender)[1]
			_name = String.lenAdjust(self.name, 10, ' ')
			_addr = String.lenAdjust(self.addr, 30, ' ')
			self.forIndex = _name + ' ' + _addr

		except:
			self.name     = AnalysisException.ANALYSIS_FAILURE
			self.addr     = AnalysisException.ANALYSIS_FAILURE
			self.forIndex = AnalysisException.ANALYSIS_FAILURE

	#
	# ダンプ
	#
	def dump(self):
		print '-sender-'
		print self.name
		print self.addr
		print ' '

EOM
