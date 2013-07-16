python <<EOM
# -*- coding:utf-8 -*-

class Title:

	#
	# コンストラクタ
	#
	def __init__(self, originData):
		try:
			decodefrag = email.Header.decode_header(originData)
			
			for string, encoding in decodefrag:
				if encoding is None:
					_title = unicode(string)
				else:
					_title = unicode(string, encoding)
		
			self.title = String.convert(_title, None, 'vim')
			self.forIndex = String.lenAdjust(self.title, 30, ' ')

		except:
			self.title    = AnalysisException.ANALYSIS_FAILURE
			self.forIndex = AnalysisException.ANALYSIS_FAILURE

	#
	# ダンプ
	#
	def dump(self):
		print '-title-'
		print self.title
		print ' '

EOM
