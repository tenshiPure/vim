"CommandAssistant

source $myScripts/MyLib/MyCursor.vim
source $myScripts/MyLib/MyString.vim

source $myScripts/TabCloser/TabCloserController.vim

source $myScripts/CommandAssistant/CommandAssistant.vim

augroup autoCmdGitAssit
	autocmd!
augroup END

autocmd autoCmdFrank BufRead,BufNewFile *.gass set filetype=gass

autocmd autoCmdGitAssit BufEnter CommandList.cass call BufMap_CommandAssistant()
autocmd autoCmdGitAssit BufEnter CommandList.cass call BufMap_CommandAssistant_CommandList()
autocmd autoCmdGitAssit BufEnter CommandResult.cass call BufMap_CommandAssistant()

function! CommandAssistantController(...)

python <<EOM

import vim
import os

argLen = vim.eval('a:0')

if argLen == '0':
	arg = 'new'
else:
	arg = vim.eval('a:1')

if arg == 'new':
	head = vim.eval('$myScripts')
	CommandList = os.path.abspath(head + '/CommandAssistant/cassfiles/CommandList.cass')
	CommandResult = os.path.abspath(head + '/CommandAssistant/cassfiles/CommandResult.cass')
	CommandListHistory = os.path.abspath(head + '/CommandAssistant/cassfiles/CommandListHistory.cass')
	CommandResultHistory = os.path.abspath(head + '/CommandAssistant/cassfiles/CommandResultHistory.cass')

	vim.command('tabedit ' + CommandResult)
	vim.command('set splitbelow')
	vim.command('split ' + CommandList)

elif arg == 'execute':
	command = MyString.getUnderCursorLine()
	commandAssistant = CommandAssistant(command)
	commandAssistant.execute()

elif arg == 'close':
	tabCloser = TabCloser()
	tabCloser.execute()

else:
	if vim.current.buffer.name == CommandList:
		command = MyString.getTargetCursorLine(int(arg))
		commandAssistant = CommandAssistant(command)
		commandAssistant.execute()

EOM

endfunction

function! BufMap_CommandAssistant()
	nnoremap <buffer> <Tab> <C-w>w
	nnoremap <buffer> gw <C-w>w
endfunction

function! BufMap_CommandAssistant_CommandList()
	nnoremap <buffer> <CR>  :call CommandAssistantController('execute')<CR>
	inoremap <buffer> <CR>  <ESC>:call CommandAssistantController('execute')<CR>
endfunction
