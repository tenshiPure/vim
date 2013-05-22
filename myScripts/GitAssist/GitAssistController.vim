"FlexibleCommentController

source $myScripts/MyLib/MyCursor.vim
source $myScripts/MyLib/MyString.vim

source $myScripts/TabCloser/TabCloserController.vim

source $myScripts/GitAssist/GitAssist.vim

augroup autoCmdGitAssit
	autocmd!
augroup END

autocmd autoCmdFrank BufRead,BufNewFile *.gass set filetype=gass

autocmd autoCmdFrank FocusLost *.gass :call GitAssistController('close')
autocmd autoCmdFrank TabLeave *.gass :call GitAssistController('close')

autocmd autoCmdGitAssit BufEnter CommandList.gass call BufMap_GitAssist()
autocmd autoCmdGitAssit BufEnter CommandList.gass call BufMap_GitAssist_CommandList()
autocmd autoCmdGitAssit BufEnter CommandResult.gass call BufMap_GitAssist()

function! GitAssistController(mode)

python <<EOM

import vim
import os

mode = vim.eval('a:mode')

if mode == 'new':
	head = vim.eval('$myScripts')
	CommandList = os.path.abspath(head + '/GitAssist/CommandList.gass')
	CommandResult = os.path.abspath(head + '/GitAssist/CommandResult.gass')

	vim.command('tabedit ' + CommandResult)
	vim.command('set splitbelow')
	vim.command('split ' + CommandList)

elif mode == 'execute':
	currentLine = int(MyCursor().getCursolLineNum())
	command = vim.current.buffer[currentLine - 1]

	if not(MyString.isBlankLine(command)):
		gitAssist = GitAssist(command)
		gitAssist.execute()

elif mode == 'close':
	tabCloser = TabCloser()
	tabCloser.execute()

EOM

endfunction

function! BufMap_GitAssist()
	nnoremap <buffer> <Tab> <C-w>w
	nnoremap <buffer> gw <C-w>w
endfunction

function! BufMap_GitAssist_CommandList()
	nnoremap <buffer> <CR>  :call GitAssistController('execute')<CR>
	inoremap <buffer> <CR>  <ESC>:call GitAssistController('execute')<CR>
endfunction
