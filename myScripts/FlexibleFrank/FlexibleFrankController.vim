"FlexibleFrank.vim

source $myScripts/myLib/myTab.vim

source $myScripts/FlexibleFrank/Entry.vim
source $myScripts/FlexibleFrank/FlexibleFrank.vim

autocmd FocusLost *.frank :call FlexibleFrankController('close')
autocmd TabLeave *.frank :call FlexibleFrankController('close')

autocmd BufRead,BufNewFile *.frank set filetype=frank

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

elif mode == 'decEnter':
	frank.commandDecEnter()

EOM

endfunction
