"Mail.vim

python <<EOM
# -*- coding:utf-8 -*-
import imaplib
import email
import email.Header
import email.utils
import time
from email.Utils import parseaddr

class Mail:

	ANALYSIS_FAILURE = String.convert('+++解析不能+++', 'utf-8', 'vim')

	#
	# コンストラクタ
	#
	def __init__(self, mailData):
		mailData = email.message_from_string(mailData)

		self.analysisTitle(mailData.get('Subject'))
		self.analysisSender(mailData.get('From'))
		self.analysisDate(mailData.get('Date'))

		self.simpleInfo = self.createSimpleInfo()

		for data in mailData.walk():
			if data.get_content_type() != 'text/plain':
				continue
				
			self.main = self.analysisMain(data)

	#
	# 解析
	#
	def analysisTitle(self, string):
		try:
			decodefrag = email.Header.decode_header(string)
			
			for string, encoding in decodefrag:
				if encoding is None:
					title = unicode(string)
				else:
					title = unicode(string, encoding)
		
			self.title = String.convert(title, None, 'vim')

		except:
			self.title = Mail.ANALYSIS_FAILURE
	
	#
	# 解析
	#
	def analysisSender(self, string):
		try:
			decodefrag = email.Header.decode_header(string)
			
			sender = ''
			for string, encoding in decodefrag:
				if encoding is None:
					sender += unicode(string)
				else:
					sender += unicode(string, encoding)
		
			sender = String.convert(sender, None, 'vim')

			self.senderName = parseaddr(sender)[0]
			self.senderAddr = parseaddr(sender)[1]

		except:
			self.senderName = Mail.ANALYSIS_FAILURE
			self.senderAddr = Mail.ANALYSIS_FAILURE
	
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
				
			oneLineMain = String.convert(oneLineMain, None, 'vim')

			return oneLineMain.split('\r\n')[:-1]

		except:
			return Mail.ANALYSIS_FAILURE

	#
	# 日付フォーマット
	#
	def analysisDate(self, date):
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

			_d = (gmt + _offset)

			weeks = {'0' : u'日', '1' : u'月', '2' : u'火', '3' : u'水', '4' : u'木', '5' : u'金', '6' : u'土'}
			_week = String.convert(weeks[_d.strftime('%w')], None, 'vim')

			self.simpleDate     = _d.strftime('%m/%d')
			self.simpleTime     = _d.strftime('%H:%M')
			self.detailDatetime = '%s(%s) %s' % (_d.strftime('%Y/%m/%d'), _week, _d.strftime('%H:%M:%S'))

		except:
			self.simpleDate     = Mail.ANALYSIS_FAILURE
			self.simpleTime     = Mail.ANALYSIS_FAILURE
			self.detailDatetime = Mail.ANALYSIS_FAILURE

	#
	# 簡易情報を作成する
	#
	def createSimpleInfo(self):
		senderNameWidth = 10
		senderAddrWidth = 30
		titleWidth = 30

		_senderName = self.stringFormat(self.senderName, 10)
		_senderAddr = self.stringFormat(self.senderAddr, 30)
		_title      = self.stringFormat(self.title,      30)

		return '%s  %s    %s    %s %s' % (_senderName, _senderAddr, _title, self.simpleDate, self.simpleTime)

	#
	# 文字列フォーマット
	#
	def stringFormat(self, string, limit):
		if limit < len(string):
			return string[:limit]
		else:
			return string + ' ' * (limit - len(string))

EOM
