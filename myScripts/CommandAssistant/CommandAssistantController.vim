"CommandAssistant

source $myScripts/MyLib/MyCursor.vim
source $myScripts/MyLib/MyString.vim

source $myScripts/TabCloser/TabCloserController.vim

source $myScripts/CommandAssistant/CommandAssistant.vim

augroup autoCmdGitAssit
	autocmd!
augroup END

autocmd autoCmdFrank BufRead,BufNewFile *.gass set filetype=gass

"autocmd autoCmdFrank FocusLost *.cass :call CommandAssistantController('close')
"autocmd autoCmdFrank TabLeave *.cass :call CommandAssistantController('close')

autocmd autoCmdGitAssit BufEnter CommandList.cass call BufMap_CommandAssistant()
autocmd autoCmdGitAssit BufEnter CommandList.cass call BufMap_CommandAssistant_CommandList()
autocmd autoCmdGitAssit BufEnter CommandResult.cass call BufMap_CommandAssistant()

function! CommandAssistantController(mode)

python <<EOM

import vim
import os

mode = vim.eval('a:mode')

if mode == 'new':
	head = vim.eval('$myScripts')
	CommandList = os.path.abspath(head + '/CommandAssistant/cassfiles/CommandList.cass')
	CommandResult = os.path.abspath(head + '/CommandAssistant/cassfiles/CommandResult.cass')
	CommandListHistory = os.path.abspath(head + '/CommandAssistant/cassfiles/CommandListHistory.cass')
	CommandResultHistory = os.path.abspath(head + '/CommandAssistant/cassfiles/CommandResultHistory.cass')

	vim.command('tabedit ' + CommandResult)
	vim.command('set splitbelow')
	vim.command('split ' + CommandList)

elif mode == 'execute':
	command = MyString.getUnderCursorLine()
	if not(MyString.isBlankLine(command)):
		gitAssist = CommandAssistant(command)
		gitAssist.execute()

elif mode == 'close':
	tabCloser = TabCloser()
	tabCloser.execute()

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
