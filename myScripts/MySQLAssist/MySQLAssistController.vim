function! MySQLAssistController()
python <<EOM
import vim

head = vim.eval('$myScripts')
DescResult = os.path.abspath(head + '/MySQLAssist/DescResult.mass')
SelectResult = os.path.abspath(head + '/MySQLAssist/SelectResult.mass')
TableList = os.path.abspath(head + '/MySQLAssist/TableList.mass')

vim.command('tabedit ' + DescResult)
vim.command('set splitbelow')
vim.command('split ' + SelectResult)
vim.command('split ' + TableList)

EOM
endfunction
