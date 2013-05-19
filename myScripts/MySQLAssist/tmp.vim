function! MySQLAssistController(command, ...)
python <<EOM
import vim

argsNum = int(vim.eval('len(a:000)'))

if 0 < argsNum:
	r = vim.eval('a:1')
else:
	r = ''

user = 'slf'
password = 'slf'
Database = 'slf'

login = '!mysql -u %(user)s -p%(password)s %(Database)s -e ' % {'user' : user, 'password' : password, 'Database' : Database}


command = vim.eval('a:command')

if command == 'select':
	if 1 < argsNum:
		all = vim.eval('a:2')
	else:
		all = ''

	if all == 'all':
		column = '*'
	else:
		column = 'service_id, doc_no, doc_title'

	table = vim.eval("expand('<cword>')")

	query = myString.surround('select %(column)s from %(table)s;' % {'column' : column, 'table' : table}, '"')

elif command == 'desc':
	table = vim.eval("expand('<cword>')")

	query = myString.surround('desc %(table)s;' % {'table' : table}, '"')

elif command == 'show':

	query = myString.surround('show tables;', '"')

else:
	query = ''

if r == '':
	vim.command(login + query)
else:
	vim.command("tabedit")
	vim.command(r + login + query)

#	SLFDocumentMngInfo
EOM
endfunction
