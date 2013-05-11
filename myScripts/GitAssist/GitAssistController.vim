"FlexibleCommentController

source $myScripts/myLib/myCursor.vim
source $myScripts/myLib/myString.vim

source $myScripts/GitAssist/GitAssist.vim

augroup autoCmdGitAssit
	autocmd!
augroup END

autocmd autoCmdGitAssit BufEnter CommandList.txt call BufMap_GitAssist()
autocmd autoCmdGitAssit BufEnter CommandList.txt call BufMap_GitAssist_CommandList()
autocmd autoCmdGitAssit BufEnter CommandResult.txt call BufMap_GitAssist()

function! GitAssistController(mode)

python <<EOM

import vim
import os

mode = vim.eval('a:mode')

if mode == 'new':
	head = vim.eval('$myScripts')
	CommandList = os.path.abspath(head + '/GitAssist/CommandList.txt')
	CommandResult = os.path.abspath(head + '/GitAssist/CommandResult.txt')

	vim.command('tabedit ' + CommandResult)
	vim.command('set splitbelow')
	vim.command('split ' + CommandList)

elif mode == 'execute':
	currentLine = int(myCursor().getCursolLineNum())
	command = vim.current.buffer[currentLine - 1]

	if not(myString.isBlankLine(command)):
		gitAssist = GitAssist(command)
		gitAssist.execute()

EOM

endfunction

function! BufMap_GitAssist()
	nnoremap <buffer> <Tab> <C-w>w
	nnoremap <buffer> gw <C-w>w
endfunction

function! BufMap_GitAssist_CommandList()
	nnoremap <buffer> <CR>  :call GitAssistController('execute')<CR>
	inoremap <buffer> <CR>  :call GitAssistController('execute')<CR>
endfunction
