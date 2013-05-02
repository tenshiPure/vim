python <<EOM
import smtplib
from email.MIMEText import MIMEText
from email.Header import Header
from email.Utils import formatdate

class ViMail:

	user = ''
	pswd = ''

	#
	# メールを作成する
	#
	def createMessage(self, fromAdd, toAdd, subject, body):
		msg = MIMEText(body)
		msg['Subject'] = subject
		msg['From'] = fromAdd
		msg['To'] = toAdd
		msg['Date'] = formatdate()
		return msg

	#
	# メール送信
	#
	def send(self, fromAdd, toAdd, msg):
		s = smtplib.SMTP('smtp.gmail.com', 587)
		s.ehlo()
		s.starttls()
		s.ehlo()
		s.login(self.user, self.pswd)
		s.sendmail(fromAdd, [toAdd], msg.as_string())
		s.close()

	#
	# コントローラからから呼ばれるメソッド
	#
	def execute(self):
		self.getAccount()
		fromAdd = self.user
		toAdd = self.user
		msg = self.createMessage(fromAdd, toAdd, 'test sub', 'test body')
		self.send(fromAdd, toAdd, msg)

	#
	#
	#
	def getAccount(self):
		file = open('account.txt', 'r')

		account = []
		for line in file:
			account.append(line[:-1])

		file.close()

		self.user = account[0]
		self.pswd = account[1]

EOM
