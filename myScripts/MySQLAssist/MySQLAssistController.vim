"MySQLAssistController.vim

source $myScripts/MySQLAssist/LoginInfo.vim
source $myScripts/MySQLAssist/MySQLQueries/Desc.vim
source $myScripts/MySQLAssist/MySQLQueries/Show.vim
source $myScripts/MySQLAssist/MySQLQueries/Select.vim

augroup autoCmdMySQLAssist
	autocmd!
augroup END

autocmd autoCmdMySQLAssist BufRead,BufNewFile *.mass set filetype=mass

autocmd autoCmdMySQLAssist FocusLost *.mass :call MySQLAssistCloser()
autocmd autoCmdMySQLAssist TabLeave *.mass :call MySQLAssistCloser()

autocmd autoCmdMySQLAssist BufEnter *.mass call BufMap_MySQLAssist()

function! MySQLAssistController()
python <<EOM
import vim

head = vim.eval('$myScripts')
DescResult = os.path.abspath(head + '/MySQLAssist/WorkingTexts/DescResult.mass')
SelectResult = os.path.abspath(head + '/MySQLAssist/WorkingTexts/SelectResult.mass')
ShowResult = os.path.abspath(head + '/MySQLAssist/WorkingTexts/ShowResult.mass')

if myTab.isBlankTab():
	vim.command('edit ' + DescResult)
else:
	vim.command('tabedit ' + DescResult)
vim.command('vsplit ' + ShowResult)
vim.command('botright 24split ' + SelectResult)



loginInfo = LoginInfo('test_user', 'test_pswd', 'test_db')

show = Show(ShowResult, loginInfo.loginCommand)
show.output()

desc = Desc(DescResult, loginInfo.loginCommand)
desc.output()

select = Select(SelectResult, loginInfo.loginCommand)
select.output()

EOM
endfunction

function! MySQLAssistCloser()
python <<EOM

tabCloser = TabCloser()
tabCloser.execute()

EOM
endfunction

function! BufMap_MySQLAssist()
	nnoremap <buffer> gw <C-w>w
endfunction
