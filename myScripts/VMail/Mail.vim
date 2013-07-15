"Mail.vim

python <<EOM
# -*- coding:utf-8 -*-
import imaplib
import email
import email.Header
import email.utils
import time

class Mail:

	ANALYSIS_FAILURE = '+++解析不能+++'.decode('utf-8').encode(vim.eval('&encoding'))

	#
	# コンストラクタ
	#
	def __init__(self, mailData):
		mailData = email.message_from_string(mailData)

		self.title = self.analysis(mailData.get('Subject'))
		self.sender = self.analysis(mailData.get('From'))
		self.date = self.dateFormat(mailData.get('Date'))

		for data in mailData.walk():
			if data.get_content_type() != 'text/plain':
				continue
				
			self.main = self.analysisMain(data)

	#
	# 解析
	#
	def analysis(self, dec_target):
		try:
			decodefrag = email.Header.decode_header(dec_target)
			title = ''
			
			for string, encoding in decodefrag:
				if encoding is None:
					title += unicode(string)
				else:
					title += unicode(string, encoding)
		
			return title.encode(vim.eval('&encoding'))

		except:
			return Mail.ANALYSIS_FAILURE
	
	#
	# 解析
	#
	def analysisMain(self, part):
		try:
			charset = str(part.get_content_charset())
			if charset is None:
				oneLineMain = part.get_payload()
			else:
				oneLineMain = unicode(part.get_payload(), charset)
				
			oneLineMain = oneLineMain.encode(vim.eval('&encoding'))

			return oneLineMain.split('\r\n')[:-1]

		except:
			return Mail.ANALYSIS_FAILURE

	#
	# 日付フォーマット
	#
	def dateFormat(self, date):
		try:
			parsed = email.utils.parsedate_tz(date)

			_year   = parsed[0]
			_month  = parsed[1]
			_day    = parsed[2]
			_hour   = parsed[3]
			_minute = parsed[4]
			_second = parsed[5]
			gmt = datetime.datetime(_year, _month, _day, _hour, _minute, _second)

			jst = datetime.timedelta(seconds = 32400)
			_offset = jst - datetime.timedelta(seconds = parsed[9])

			_datetime = (gmt + _offset)

			_date = _datetime.strftime('%Y/%m/%d')
			_time = _datetime.strftime('%H:%M:%S')

			weeks = {'0' : u'日', '1' : u'月', '2' : u'火', '3' : u'水', '4' : u'木', '5' : u'金', '6' : u'土'}
			_week = weeks[_datetime.strftime('%w')].encode(vim.eval('&encoding'))

			return '%s(%s) %s' % (_date, _week, _time)

		except Exception as e:
			return Mail.ANALYSIS_FAILURE

	#
	# メールダンプ
	#
	def dump(self):
		print 'タイトル : '.decode('utf-8').encode('cp932') + self.title
		print '送信者   : '.decode('utf-8').encode('cp932') + self.sender
		print '送信日時 : '.decode('utf-8').encode('cp932') + self.date
		print '本文 ...'.decode('utf-8').encode('cp932')
		for line in self.main:
			print line

EOM
