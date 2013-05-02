import imaplib
from email.header import decode_header

mail = imaplib.IMAP4_SSL('imap.gmail.com')

file = open('account.txt', 'r')

account = []
for line in file:
	account.append(line[:-1])

file.close()

mail.login(account[0], account[1])

mail.select()

_, [data] = mail.search(None, 'ALL')

for i in data.split(' '):
	_, sub = mail.fetch(i, '(BODY[HEADER.FIELDS (SUBJECT)])')
	
	try:
		decoded = decode_header(sub[0][1].strip())[1]
		print unicode(decoded[0], decoded[1])
	except:
		print sub[0][1].strip()

	if int(i) == 8:
		break

mail.close()
mail.logout()
