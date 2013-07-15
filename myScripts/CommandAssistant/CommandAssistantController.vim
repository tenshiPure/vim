"CommandAssistant

source $myScripts/CommandAssistant/CommandAssistant.vim
source $myScripts/CommandAssistant/CommandAssistantHistory.vim

augroup autoCmdGitAssit
	autocmd!
augroup END

autocmd autoCmdGitAssit BufRead,BufNewFile *.cass set filetype=cass

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

workingDir = vim.eval('$myScripts') + '/CommandAssistant/WorkingTexts/'
CommandList          = os.path.abspath(workingDir + 'CommandList.cass')
CommandResult        = os.path.abspath(workingDir + 'CommandResult.cass')
CommandListHistory   = os.path.abspath(workingDir + 'ommandListHistory.cass')
CommandResultHistory = os.path.abspath(workingDir + 'CommandResultHistory.cass')

if arg == 'new':
	Tab.expandTwoHorizontally(CommandList, None, CommandResult, None, CommandList)

elif arg == 'history':
	Tab.expandTwoHorizontally(CommandListHistory, None, CommandResultHistory, None, CommandListHistory)

elif arg == 'execute':
	cursorLine = String.getLineFromCurrentBuffer()
	if vim.current.buffer.name == CommandList:
		commandAssistant = CommandAssistant(cursorLine)
		commandAssistant.execute()
	elif vim.current.buffer.name == CommandListHistory:
		commandAssistantHistory = CommandAssistantHistory(cursorLine)
		commandAssistantHistory.execute()

elif arg == 'hist':
	if vim.current.buffer.name == CommandList:
		print 'hist'

else:
	if vim.current.buffer.name == CommandList:
		command = String.getLineFromCurrentBuffer(int(arg))
		commandAssistant = CommandAssistant(command)
		commandAssistant.execute()

EOM

endfunction

function! BufMap_CommandAssistant_execute()
	nnoremap <buffer> <CR>  :call CommandAssistantController('execute')<CR>
	inoremap <buffer> <CR>  <ESC>:call CommandAssistantController('execute')<CR>
endfunction
