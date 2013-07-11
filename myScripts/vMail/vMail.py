# -*- coding: utf-8 -*-

from Const import Const
from imaplib import *

#
# 起動
#
def setUp():
	gmail = IMAP4_SSL("imap.gmail.com")
	gmail.login(Const.USER, Const.PASS)

	gmail.list()
	gmail.select('Inbox')

	return gmail

#
# 終了
#
def tearDown(gmail):
	gmail.logout()

#
# 未読メールを参照する
#
def selectUnseenMails(gmail):
	status, mailList = gmail.search(None, '(UNSEEN)')

	if status == 'OK':
		if mailList[0] is not '':
			print 'there are SOME new mails'
		else:
			print 'there are NO new mails'

#
# 全メールを参照する
#
def selectAllMails(gmail):
	status, [mailList] = gmail.search(None, 'ALL')

	for index in mailList.split(' '):

		if index == '141':
			_, subject = gmail.fetch(index, '(BODY[HEADER.FIELDS (SUBJECT)])')
			subject = subject[0][1].strip()

			print subject


gmail = setUp()
#selectUnseenMails(gmail)
selectAllMails(gmail)
tearDown(gmail)
