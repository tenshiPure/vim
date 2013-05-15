function! DBAssistController(mode)
python <<EOM
import vim

user = 'slf'
password = 'slf'
Database = 'slf'

login = '!mysql -u %(user)s -p%(password)s %(Database)s -e ' % {'user' : user, 'password' : password, 'Database' : Database}


mode = vim.eval('a:mode')

if mode == 'select':
	column = 'service_id, doc_no, doc_title'
	table = 'SLFDocumentMngInfo'

	query = myString.surround('select %(column)s from %(table)s;' % {'column' : column, 'table' : table}, '"')

elif mode == 'desc':
	table = 'SLFDocumentMngInfo'

	query = myString.surround('desc %(table)s;' % {'table' : table}, '"')

else:
	query = ''

vim.command(login + query)

EOM
endfunction

