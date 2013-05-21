"MySQLAssistController.vim

augroup autoCmdMySQLAssist
	autocmd!
augroup END

autocmd autoCmdMySQLAssist BufRead,BufNewFile *.mass set filetype=mass

autocmd autoCmdMySQLAssist FocusLost *.mass :call MySQLAssistCloser()
autocmd autoCmdMySQLAssist TabLeave *.mass :call MySQLAssistCloser()

function! MySQLAssistController()
python <<EOM
import vim

head = vim.eval('$myScripts')
DescResult = os.path.abspath(head + '/MySQLAssist/DescResult.mass')
SelectResult = os.path.abspath(head + '/MySQLAssist/SelectResult.mass')
TableList = os.path.abspath(head + '/MySQLAssist/TableList.mass')

if myTab.isBlankTab():
	vim.command('edit ' + DescResult)
else:
	vim.command('tabedit ' + DescResult)
vim.command('vsplit ' + TableList)
vim.command('botright 30split ' + SelectResult)

EOM
endfunction

function! MySQLAssistCloser()
python <<EOM

tabCloser = TabCloser()
tabCloser.execute()

EOM
endfunction
