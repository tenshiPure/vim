python <<EOM
# -*- coding:utf-8 -*-
import imaplib
import email
import email.Header
import email.utils
import time
from email.Utils import parseaddr

class Mail:

	#
	# コンストラクタ
	#
	def __init__(self, mailData):
		mailData = email.message_from_string(mailData)

		self.title = Title(mailData.get('Subject'))
		self.sender = Sender(mailData.get('From'))
		self.date = Date(mailData.get('Date'))

		for data in mailData.walk():
			if data.get_content_type() != 'text/plain':
				continue
				
			self.main = Main(data)

	#
	# ダンプ
	#
	def dump(self):
		self.title.dump()
		self.sender.dump()
		self.date.dump()
		self.main.dump()

EOM
