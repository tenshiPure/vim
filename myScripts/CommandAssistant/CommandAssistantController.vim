"CommandAssistant

source $myScripts/MyLib/MyCursor.vim
source $myScripts/MyLib/MyString.vim

source $myScripts/TabCloser/TabCloserController.vim

source $myScripts/CommandAssistant/CommandAssistant.vim
source $myScripts/CommandAssistant/CommandAssistantHistory.vim

augroup autoCmdGitAssit
	autocmd!
augroup END

autocmd autoCmdFrank BufRead,BufNewFile *.cass set filetype=cass

autocmd autoCmdGitAssit BufEnter CommandList.cass call BufMap_CommandAssistant_execute()
autocmd autoCmdGitAssit BufEnter CommandListHistory.cass call BufMap_CommandAssistant_execute()

function! CommandAssistantController(...)

python <<EOM

import vim
import os

argLen = vim.eval('a:0')

if argLen == '0':
	arg = 'new'
else:
	arg = vim.eval('a:1')

head = vim.eval('$myScripts')
CommandList = os.path.abspath(head + '/CommandAssistant/CassFiles/CommandList.cass')
CommandResult = os.path.abspath(head + '/CommandAssistant/CassFiles/CommandResult.cass')
CommandListHistory = os.path.abspath(head + '/CommandAssistant/CassFiles/CommandListHistory.cass')
CommandResultHistory = os.path.abspath(head + '/CommandAssistant/CassFiles/CommandResultHistory.cass')

if arg == 'new':

	vim.command('tabedit ' + CommandResult)
	vim.command('set splitbelow')
	vim.command('split ' + CommandList)

elif arg == 'history':

	vim.command('tabedit ' + CommandResultHistory)
	vim.command('set splitbelow')
	vim.command('split ' + CommandListHistory)

elif arg == 'execute':
	cursorLine = MyString.getUnderCursorLine()
	if vim.current.buffer.name == CommandList:
		commandAssistant = CommandAssistant(cursorLine)
		commandAssistant.execute()
	elif vim.current.buffer.name == CommandListHistory:
		commandAssistantHistory = CommandAssistantHistory(cursorLine)
		commandAssistantHistory.execute()

elif arg == 'close':
	tabCloser = TabCloser()
	tabCloser.execute()

elif arg == 'hist':
	if vim.current.buffer.name == CommandList:
		print 'hist'

else:
	if vim.current.buffer.name == CommandList:
		command = MyString.getTargetCursorLine(int(arg))
		commandAssistant = CommandAssistant(command)
		commandAssistant.execute()

EOM

endfunction

function! BufMap_CommandAssistant_execute()
	nnoremap <buffer> <CR>  :call CommandAssistantController('execute')<CR>
	inoremap <buffer> <CR>  <ESC>:call CommandAssistantController('execute')<CR>
endfunction
