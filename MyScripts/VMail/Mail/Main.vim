python <<EOM
# -*- coding:utf-8 -*-

class Main:

	#
	# コンストラクタ
	#
	def __init__(self, part):
		try:
			charset = str(part.get_content_charset())
			if charset is None:
				oneLineMain = part.get_payload()
			else:
				oneLineMain = unicode(part.get_payload(), charset)
				
			oneLineMain = String.convert(oneLineMain, None, 'vim')

			self.detail = oneLineMain.split('\r\n')[:-1]

		except:
			self.detail = Mail.ANALYSIS_FAILURE

	#
	# ダンプ
	#
	def dump(self):
		print '-main-'
		for line in self.detail:
			print line
		print ' '

EOM
