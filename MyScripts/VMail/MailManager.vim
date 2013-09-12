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
		for index in indices[::-1]:
			_, mailData = gmail.fetch(index, '(RFC822)')
			self.mails[num] = Mail(mailData[0][1])
			num += 1

		self._tearDown(gmail)

	#
	# メールリストを出力する
	#
	def outputMailList(self):
		simpleInfo = []
		for mail in self.mails.itervalues():
			simpleInfo.append(self.createSimpleInfo(mail))

		Tab.switchTab(simpleInfoPath, 2)
		_Buffer().clear()

		buf = _Buffer()
		buf.writeWithList(1, simpleInfo)

	#
	# 簡易情報を作成する
	#
	def createSimpleInfo(self, mail):
		return '%s    %s    %s' % (mail.sender.simple, mail.title.simple, mail.date.simple)

	#
	# 本文を出力する
	#
	def outputMain(self, index):
		Tab.switchTab(mainPath, 2)
		_Buffer().clear()

		buf = _Buffer()
		buf.writeWithList(1, self.mails[index].main.detail)

		Tab.switchTab(simpleInfoPath, 2)

	#
	# 詳細情報を出力する
	#
	def outputDetail(self, index, target):
		mail = self.mails[index]

		if target == 'sender':
			print mail.sender.detail

		elif target == 'title':
			print mail.title.detail

		elif target == 'date':
			print mail.date.detail

	#
	# 詳細情報を作成する
	#
	def createDetailInfo(self, mail):
		return '%s    %s    %s' % (mail.sender.detail, mail.title.detail, mail.date.detail)

	#
	# 起動
	#
	def _setUp(self):
		gmail = imaplib.IMAP4_SSL("imap.gmail.com")
		gmail.login(AccountInfo.USER, AccountInfo.PASS)

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
