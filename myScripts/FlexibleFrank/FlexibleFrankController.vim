"FlexibleFrank.vim

source $myScripts/myLib/myCursor.vim
source $myScripts/myLib/myTab.vim

source $myScripts/FlexibleFrank/FlexibleFrank.vim
source $myScripts/FlexibleFrank/Entry.vim

source $myScripts/FlexibleFrank/command/Helper.vim
source $myScripts/FlexibleFrank/command/Edit.vim
source $myScripts/FlexibleFrank/command/ChangeDir.vim
source $myScripts/FlexibleFrank/command/Explorer.vim
source $myScripts/FlexibleFrank/command/Copy.vim
source $myScripts/FlexibleFrank/command/Move.vim
source $myScripts/FlexibleFrank/command/Delete.vim

augroup autoCmdFrank
	autocmd!
augroup END

"autocmd autoCmdFrank FocusLost *.frank :call FlexibleFrankController('close')
"autocmd autoCmdFrank TabLeave *.frank :call FlexibleFrankController('close')
autocmd autoCmdFrank BufRead,BufNewFile *.frank set filetype=frank
autocmd autoCmdFrank BufEnter *.frank call SetBufLocalMapping()

function! FlexibleFrankController(mode) range

python <<EOM

import vim

mode = vim.eval('a:mode')
firstLine = vim.eval('a:firstline')
lastLine = vim.eval('a:lastline')

if mode == 'new':
	frank = FlexibleFrank()
	frank.newFrank()

elif mode == 'close':
	myTab.closeWorkingTexts()

elif mode == 'reload':
	frank.reloadFrank()

elif mode == 'pointOn':
	frank.pointOn(int(firstLine), int(lastLine))

elif mode == 'pointOff':
	frank.pointOff(int(firstLine), int(lastLine))

elif mode == 'edit':
	Edit.execute(frank)

elif mode == 'openDir':
	Explorer.openDir(frank)

elif mode == 'openByApp':
	Explorer.openByApp(frank)

elif mode == 'cd':
	ChangeDir.cd(frank)

elif mode == 'upperDir':
	ChangeDir.upperDir()

elif mode == 'lastDir':
	ChangeDir.lastDir()

elif mode == 'tab':
	if frank.single:
		frank.moreFrank()
	else:
		myTab.changeWindow()

elif mode == 'copy':
	Copy.execute(frank)

elif mode == 'move':
	Move.execute(frank)

elif mode == 'delete':
	Delete.execute(frank)

EOM

endfunction

function! SetBufLocalMapping()
	nnoremap <buffer> e         :call FlexibleFrankController('edit')<CR>
	nnoremap <buffer> m         :call FlexibleFrankController('cd')<CR>
	nnoremap <buffer> o         :call FlexibleFrankController('openDir')<CR>
	nnoremap <buffer> a         :call FlexibleFrankController('openByApp')<CR>
	nnoremap <buffer> h         :call FlexibleFrankController('upperDir')<CR>
	nnoremap <buffer> l         :call FlexibleFrankController('lastDir')<CR>
	nnoremap <buffer> C         :call FlexibleFrankController('copy')<CR>
	nnoremap <buffer> M         :call FlexibleFrankController('move')<CR>
	nnoremap <buffer> D         :call FlexibleFrankController('delete')<CR>
	nnoremap <buffer> <F5>      :call FlexibleFrankController('reload')<CR>
	nnoremap <buffer> p   :call FlexibleFrankController('pointOn')<CR>
	vnoremap <buffer> p   :call FlexibleFrankController('pointOn')<CR>
	nnoremap <buffer> <S-p> :call FlexibleFrankController('pointOff')<CR>
	vnoremap <buffer> <S-p> :call FlexibleFrankController('pointOff')<CR>
	nnoremap <buffer> <Tab> :call FlexibleFrankController('tab')<CR>
	nnoremap <buffer> gw <C-w>w
endfunction
