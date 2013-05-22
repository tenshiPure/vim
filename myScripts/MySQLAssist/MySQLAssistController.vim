"MySQLAssistController.vim

source $myScripts/MyLib/MyCursor.vim

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

if MyTab.isBlankTab():
	vim.command('edit ' + DescResult)
else:
	vim.command('tabedit ' + DescResult)
vim.command('vsplit ' + ShowResult)
vim.command('botright 24split ' + SelectResult)



loginInfo = LoginInfo('test_user', 'test_pswd', 'test_db')

show = Show(ShowResult, loginInfo.loginCommand)
show.output()

#MyTab.switchTab(ShowResult, 3)
MyCursor().setPosOptional(4, 0, 0)

EOM
endfunction

function! MySQLAssistCloser()
python <<EOM

tabCloser = TabCloser()
tabCloser.execute()

EOM
endfunction

function! MySQLAssistCR()
python <<EOM
import vim

if vim.current.buffer.name != ShowResult:
	print 'MySQLAssist ... only ShowResult Tab'
else:
	currentLine = int(MyCursor().getCursolLineNum())
	if MyString.isBlankLine(vim.current.buffer[currentLine - 1]):
		print 'MySQLAssist ... only non blank line'
	else:
		table = vim.current.buffer[currentLine - 1]
		desc = Desc(DescResult, loginInfo.loginCommand, table)
		desc.output()

		select = Select(SelectResult, loginInfo.loginCommand, table)
		select.output()

		MyTab.switchTab(ShowResult, 3)

EOM
endfunction

function! BufMap_MySQLAssist()
	nnoremap <buffer> gw <C-w>w
	nnoremap <buffer> <CR> :call MySQLAssistCR()<CR>
endfunction
