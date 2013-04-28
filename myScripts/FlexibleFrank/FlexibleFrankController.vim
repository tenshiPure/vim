"FlexibleFrank.vim

source $myScripts/myLib/myCursor.vim
source $myScripts/myLib/myTab.vim

source $myScripts/FlexibleFrank/FlexibleFrank.vim
source $myScripts/FlexibleFrank/Entry.vim

source $myScripts/FlexibleFrank/command/Helper.vim
source $myScripts/FlexibleFrank/command/Edit.vim
source $myScripts/FlexibleFrank/command/Move.vim
source $myScripts/FlexibleFrank/command/Explorer.vim

augroup autoCmdFrank
	autocmd!
augroup END

"autocmd autoCmdFrank FocusLost *.frank :call FlexibleFrankController('close')
"autocmd autoCmdFrank TabLeave *.frank :call FlexibleFrankController('close')
autocmd autoCmdFrank BufRead,BufNewFile *.frank set filetype=frank
autocmd autoCmdFrank BufEnter *.frank call SetBufLocalMapping()

function! FlexibleFrankController(mode)

python <<EOM

import vim

mode = vim.eval('a:mode')

if mode == 'new':
	frank = FlexibleFrank()
	frank.newFrank()

elif mode == 'close':
	myTab.closeWorkingText()

elif mode == 'reload':
	frank.reloadFrank()

elif mode == 'edit':
	Edit.execute(frank)

elif mode == 'openDir':
	Explorer.openDir(frank)

elif mode == 'openByApp':
	Explorer.openByApp(frank)

elif mode == 'move':
	Move.move(frank)

elif mode == 'upperDir':
	Move.upperDir()

elif mode == 'lastDir':
	Move.lastDir()

EOM

endfunction

function! SetBufLocalMapping()
	nnoremap <buffer> e    :call FlexibleFrankController('edit')<CR>
	nnoremap <buffer> m    :call FlexibleFrankController('move')<CR>
	nnoremap <buffer> o    :call FlexibleFrankController('openDir')<CR>
	nnoremap <buffer> a    :call FlexibleFrankController('openByApp')<CR>
	nnoremap <buffer> h    :call FlexibleFrankController('upperDir')<CR>
	nnoremap <buffer> l    :call FlexibleFrankController('lastDir')<CR>
	nnoremap <buffer> <F5> :call FlexibleFrankController('reload')<CR>
endfunction
