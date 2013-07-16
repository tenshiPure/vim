python <<EOM
# -*- coding:utf-8 -*-

class Title:

	WIDTH_LIMIT = 50
	NO_TITLE = '---'

	#
	# コンストラクタ
	#
	def __init__(self, originData):
		try:
			decodefrag = email.Header.decode_header(originData)
			
			for string, encoding in decodefrag:
				if string in ['', 'None']:
					_title = Title.NO_TITLE

				elif encoding is None:
					_title = unicode(string)
				else:
					_title = unicode(string, encoding)
		
			_title = String.convert(_title, None, 'vim').rstrip()

			self.simple = String.lenAdjust(_title, Title.WIDTH_LIMIT, ' ')
			self.detail = _title

		except:
			self.simple = String.lenAdjust(AnalysisException.ANALYSIS_FAILURE, Title.WIDTH_LIMIT, ' ')
			self.detail = AnalysisException.ANALYSIS_FAILURE

	#
	# ダンプ
	#
	def dump(self):
		print '-title-'
		print self.simple
		print self.detail
		print ' '

EOM
