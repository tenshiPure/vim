"MailManager.vim

python <<EOM
# -*- coding:utf-8 -*-
import imaplib

class MailManager:

	#
	# コンストラクタ
	#
	def __init__(self, first, last):
		gmail = self._setUp()

		indices = self._getMailIndexWithinRange(gmail, first, last)

		self.mails = {}
		num = 1
		for index in indices:
			_, mailData = gmail.fetch(index, '(RFC822)')
			self.mails[num] = Mail(mailData[0][1])
			num += 1

		self._tearDown(gmail)

	#
	# 指定範囲のメールのタイトルリストを返す
	#
	def getTitles(self):
		titles = []
		for mail in self.mails.itervalues():
			titles.append(mail.title)

		return titles

	#
	# 起動
	#
	def _setUp(self):
		gmail = imaplib.IMAP4_SSL("imap.gmail.com")
		gmail.login(Const.USER, Const.PASS)

		gmail.list()
		gmail.select('Inbox')

		return gmail

	#
	# 終了
	#
	def _tearDown(self, gmail):
		gmail.logout()

	#
	# 全メールのインデックスを取得
	#
	def _getAllMailIndex(self, gmail):
		_, [indices] = gmail.search(None, 'ALL')

		return indices.split(' ')

	#
	# 最新のメールのインデックスを得る
	#
	def _getNewestMailIndex(self, gmail):
		indices = self._getAllMailIndex(gmail)

		return [indices[-1]]

	#
	# 指定範囲のメールのインデックスを得る
	#
	def _getMailIndexWithinRange(self, gmail, first, last):
		indices = self._getAllMailIndex(gmail)
		newestIndex = int(self._getNewestMailIndex(gmail)[0])

		if first < 1:
			first = 1
		if newestIndex < last:
			last = newestIndex

		intIndices = range(first, last + 1)

		strIndices = []
		for intIndex in intIndices:
			strIndices.append(str(intIndex))

		return strIndices

EOM
