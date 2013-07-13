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


gmail = setUp()

_, mailData = gmail.fetch('143', '(RFC822)')
mail = Mail(mailData[0][1])

mail.dump()

tearDown(gmail)

EOM

endfunction
