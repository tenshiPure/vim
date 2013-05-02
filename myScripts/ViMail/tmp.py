import imaplib

mail = imaplib.IMAP4_SSL('imap.gmail.com')

file = open('account.txt', 'r')

account = []
for line in file:
	account.append(line[:-1])

file.close()

mail.login(account[0], account[1])

mail.select()

_, [data] = mail.search(None, 'ALL')

print len(data)
#for i in data.split(' '):
#	_, sub = mail.fetch(i, '(BODY[HEADER.FIELDS (SUBJECT)])')
#	print sub[0][1].strip()

mail.logout()

