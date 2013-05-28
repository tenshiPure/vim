"FlexibleFrank.vim

source $myScripts/FlexibleFrank/CommandDispatcher.vim
source $myScripts/FlexibleFrank/CommandFactory.vim
source $myScripts/FlexibleFrank/Entry.vim
source $myScripts/FlexibleFrank/EntryManager.vim

augroup autoCmdFrank
	autocmd!
augroup END

autocmd autoCmdFrank BufRead,BufNewFile *.frank set filetype=frank
autocmd autoCmdFrank FocusLost *.frank :call CommandDispatcher('Close')
autocmd autoCmdFrank TabLeave *.frank :call CommandDispatcher('Close')
autocmd autoCmdFrank BufEnter Frank1.frank call BufMap_Frank()
autocmd autoCmdFrank BufEnter Frank2.frank call BufMap_Frank()
autocmd autoCmdFrank BufEnter Frank3.frank call BufMap_Frank3()

function! FlexibleFrankController(targetDir)

python <<EOM

import vim
import os

targetDir = os.path.abspath(vim.eval('a:targetDir'))

head = vim.eval('$myScripts') + '/FlexibleFrank/WorkingTexts/'
pathFrank1 = os.path.abspath(head + 'Frank1.frank')
pathFrank2 = os.path.abspath(head + 'Frank2.frank')
pathFrank3 = os.path.abspath(head + 'Frank3.frank')

MyTab.ExpandReverseT(pathFrank1, pathFrank2, pathFrank3, 9)

frank = EntryManager(targetDir, pathFrank1)
frank.outputFrank()

MyTab.switchTab(pathFrank1, 3)

EOM

endfunction

function! BufMap_Frank()
	nnoremap <buffer> e     :call CommandDispatcher('Edit')<CR>
	vnoremap <buffer> e     :call CommandDispatcher('Edit')<CR>
	nnoremap <buffer> mm    :call CommandDispatcher('ChangeDir')<CR>
	nnoremap <buffer> h     :call CommandDispatcher('ChangeDirUpper')<CR>
	nnoremap <buffer> l     :call CommandDispatcher('ChangeDirBefore')<CR>
	nnoremap <buffer> o     :call CommandDispatcher('OpenDir')<CR>
	nnoremap <buffer> a     :call CommandDispatcher('OpenByApp')<CR>
	nnoremap <buffer> cp    :call CommandDispatcher('Copy')<CR>
	vnoremap <buffer> cp    :call CommandDispatcher('Copy')<CR>
	nnoremap <buffer> mv    :call CommandDispatcher('Move')<CR>
	vnoremap <buffer> mv    :call CommandDispatcher('Move')<CR>
	nnoremap <buffer> rm    :call CommandDispatcher('Delete')<CR>
	vnoremap <buffer> rm    :call CommandDispatcher('Delete')<CR>
	nnoremap <buffer> re    :call CommandDispatcher('Rename')<CR>
	vnoremap <buffer> re    :call CommandDispatcher('Rename')<CR>
	nnoremap <buffer> rd    :call CommandDispatcher('Reed')<CR>
	nnoremap <buffer> mk    :call CommandDispatcher('Mkdir')<CR>
	nnoremap <buffer> p     :call CommandDispatcher('PointOn')<CR>
	vnoremap <buffer> p     :call CommandDispatcher('PointOn')<CR>
	nnoremap <buffer> <S-p> :call CommandDispatcher('PointOff')<CR>
	vnoremap <buffer> <S-p> :call CommandDispatcher('PointOff')<CR>
	nnoremap <buffer> fix   :call CommandDispatcher('Fix')<CR>
	nnoremap <buffer> sw    :call CommandDispatcher('Switch')<CR>
	nnoremap <buffer> gr    :call CommandDispatcher('Grep')<CR>
	nnoremap <buffer> gw    <C-w>w
endfunction

function! BufMap_Frank3()
	nnoremap <buffer> gw    <C-w>w
endfunction
