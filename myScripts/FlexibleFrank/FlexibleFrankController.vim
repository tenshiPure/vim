"FlexibleFrank.vim

source $myScripts/myLib/myCursor.vim
source $myScripts/myLib/myTab.vim

source $myScripts/FlexibleFrank/FlexibleFrank.vim
source $myScripts/FlexibleFrank/Entry.vim
source $myScripts/FlexibleFrank/executableHelper.vim
source $myScripts/FlexibleFrank/commandOpen.vim

augroup autoCmdFrank
	autocmd!
augroup END

"autocmd autoCmdFrank FocusLost *.frank :call FlexibleFrankController('close')
"autocmd autoCmdFrank TabLeave *.frank :call FlexibleFrankController('close')
autocmd autoCmdFrank BufRead,BufNewFile *.frank set filetype=frank

function! FlexibleFrankController(mode)

python <<EOM

import vim

mode = vim.eval('a:mode')

if mode == 'new':
	frank = FlexibleFrank()
	frank.newFrank()

elif mode == 'close':
	myTab.closeWorkingText()

elif mode == 'enter':
	frank.commandEnter()

elif mode == 'open':
	executableHelper.commandDispatch(frank, 'open')

elif mode == 'reload':
	frank.reloadFrank()

EOM

endfunction
