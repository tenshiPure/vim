"VMailController.vim

source $myScripts/VMail/Mail.vim
source $myScripts/VMail/Const.vim

function! VMailController()

python <<EOM
import imaplib

#
# 起動
#
def setUp():
	gmail = imaplib.IMAP4_SSL("imap.gmail.com")
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
# 全メールのインデックスを取得
#
def _getAllMailIndex(gmail):
	_, [indices] = gmail.search(None, 'ALL')

	return indices.split(' ')

#
# 最新のメールのインデックスを得る
#
def getNewestMailIndex(gmail):
	indices = _getAllMailIndex(gmail)

	return [indices[-1]]

#
# 指定範囲のメールのインデックスを得る
#
def getMailIndexWithinRange(gmail, first, last):
	indices = _getAllMailIndex(gmail)
	newestIndex = int(getNewestMailIndex(gmail)[0])

	if first < 1:
		first = 1
	if newestIndex < last:
		last = newestIndex

	intIndices = range(first, last + 1)

	strIndices = []
	for intIndex in intIndices:
		strIndices.append(str(intIndex))

	return strIndices


gmail = setUp()

indices = getNewestMailIndex(gmail)
#indices = getMailIndexWithinRange(gmail, 1, 5)

for index in indices:
	_, mailData = gmail.fetch(index, '(RFC822)')
	mail = Mail(mailData[0][1])
	mail.dump()

tearDown(gmail)

EOM

endfunction
