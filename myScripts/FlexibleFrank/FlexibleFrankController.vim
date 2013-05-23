"FlexibleFrank.vim

source $myScripts/FlexibleFrank/EntryManager.vim
source $myScripts/FlexibleFrank/Entry.vim
source $myScripts/FlexibleFrank/CommandDispatcher.vim

augroup autoCmdFrank
	autocmd!
augroup END

autocmd autoCmdFrank BufRead,BufNewFile *.frank set filetype=frank

autocmd autoCmdFrank FocusLost *.frank :call CommandDispatcher('close')
autocmd autoCmdFrank TabLeave *.frank :call CommandDispatcher('close')

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

MyTab.ExpandReverseT(pathFrank1, pathFrank2, pathFrank3, 4)

frank1 = EntryManager(targetDir, pathFrank1)
frank1.outputFrank()

frank2 = EntryManager(targetDir, pathFrank2)
frank2.outputFrank()

MyTab.switchTab(pathFrank1, 3)

EOM

endfunction

function! BufMap_Frank()
	nnoremap <buffer> e     :call CommandDispatcher('edit')<CR>
	nnoremap <buffer> m     :call CommandDispatcher('cd')<CR>
	nnoremap <buffer> h     :call CommandDispatcher('cdUpper')<CR>
	nnoremap <buffer> l     :call CommandDispatcher('cdLast')<CR>
	nnoremap <buffer> o     :call CommandDispatcher('openDir')<CR>
	nnoremap <buffer> a     :call CommandDispatcher('openByApp')<CR>
	nnoremap <buffer> cp    :call CommandDispatcher('copy')<CR>
	nnoremap <buffer> mv    :call CommandDispatcher('move')<CR>
	nnoremap <buffer> rm    :call CommandDispatcher('delete')<CR>
	nnoremap <buffer> mk    :call CommandDispatcher('mkdir')<CR>
	nnoremap <buffer> re    :call CommandDispatcher('renameBuf')<CR>
	nnoremap <buffer> <F5>  :call CommandDispatcher('reload')<CR>
	nnoremap <buffer> p     :call CommandDispatcher('pointOn')<CR>
	vnoremap <buffer> p     :call CommandDispatcher('pointOn')<CR>
	nnoremap <buffer> <S-p> :call CommandDispatcher('pointOff')<CR>
	vnoremap <buffer> <S-p> :call CommandDispatcher('pointOff')<CR>
	nnoremap <buffer> <Tab> :call CommandDispatcher('tab')<CR>
	nnoremap <buffer> gw    <C-w>w
endfunction

function! BufMap_Frank3()
	nnoremap <buffer> fix   :call CommandDispatcher('renameFix')<CR>
	nnoremap <buffer> gw    <C-w>w
endfunction
