"Mail.vim

python <<EOM
# -*- coding:utf-8 -*-
import imaplib
import email
import email.Header
import time

class Mail:

	#
	# コンストラクタ
	#
	def __init__(self, mailData):
		mailData = email.message_from_string(mailData)

		self.title = self.decode(mailData.get('Subject'))
		self.sender = self.decode(mailData.get('From'))
		self.date = self.dateFormat(mailData.get('Date'))

		for data in mailData.walk():
			if data.get_content_type() != 'text/plain':
				continue
				
			self.body = self.decode_body(data)

	#
	# デコード
	#
	def decode(self, dec_target):
		decodefrag = email.Header.decode_header(dec_target)
		title = ''
		
		for string, encoding in decodefrag:
			if encoding is None:
				title += unicode(string)
			else:
				title += unicode(string, encoding)
		
		return title
	
	#
	# デコード
	#
	def decode_body(self, part):
		charset = str(part.get_content_charset())
		if charset is None:
			body = part.get_payload()
		else:
			body = unicode(part.get_payload(), charset)
			
		return body

	#
	# 日付フォーマット
	#
	def dateFormat(self, date_string):
		
		format_pattern = '%a, %d %b %Y %H:%M:%S'

		f = time.strptime(date_string[:-6], format_pattern)

		weeks = {0 : u'月', 1 : u'火', 2 : u'水', 3 : u'木', 4 : u'金', 5 : u'土', 6 : u'日'}
		week = weeks[f.tm_wday]

		return "%s/%s/%s(%s) %s:%s:%s" % (f.tm_year, f.tm_mon, f.tm_mday, week, f.tm_hour, f.tm_min, f.tm_sec)

	#
	# メールダンプ
	#
	def dump(self):
		print self.title
		print self.sender
		print self.date
		print self.body

EOM
