# -*- coding: utf-8 -*-

from Const import Const
from imaplib import *

gmail = IMAP4_SSL("imap.gmail.com")
gmail.login(Const.USER, Const.PASS)

gmail.list()
gmail.select('Inbox')
status, mailList = gmail.search(None, '(UNSEEN)')

print status
print mailList

if status == 'OK':
	if mailList[0] is not '':
		print 'new'
	else:
		print 'none'
