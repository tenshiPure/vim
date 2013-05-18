"FlexibleFrank2.vim

source $myScripts/FlexibleFrank2/EntryManager.vim
source $myScripts/FlexibleFrank2/Entry.vim
source $myScripts/FlexibleFrank2/CommandDispatcher.vim

augroup autoCmdFrank2
	autocmd!
augroup END

autocmd autoCmdFrank2 BufRead,BufNewFile *.frank2 set filetype=frank2

autocmd autoCmdFrank2 FocusLost *.frank2 :call CommandDispatcher('close')
autocmd autoCmdFrank2 TabLeave *.frank2 :call CommandDispatcher('close')

autocmd autoCmdFrank2 BufEnter Frank1.frank2 call BufMap_Frank()
autocmd autoCmdFrank2 BufEnter Frank2.frank2 call BufMap_Frank()
autocmd autoCmdFrank2 BufEnter Rename.frank2 call BufMap_Rename()

function! FlexibleFrank2Controller(targetDir)

python <<EOM

import vim
import os

targetDir = os.path.abspath(vim.eval('a:targetDir'))

head = vim.eval('$myScripts') + '/FlexibleFrank2/WorkingTexts/'
Frank1 = os.path.abspath(head + 'Frank1.frank2')
Frank2 = os.path.abspath(head + 'Frank2.frank2')

vim.command('tabedit ' + Frank1)

frank1 = EntryManager(targetDir)
frank1.initWorkingText(targetDir)
frank1.outputEntries()

#vim.command('set splitright')
#vim.command('vsplit ' + Frank2)
#frank2 = EntryManager(targetDir)
#frank2.initWorkingText(targetDir)
#frank2.outputEntries()

EOM

endfunction

function! BufMap_Frank()
	nnoremap <buffer> e         :call CommandDispatcher('edit')<CR>
	nnoremap <buffer> m         :call CommandDispatcher('lcd')<CR>
	nnoremap <buffer> M         :call CommandDispatcher('cd')<CR>
	nnoremap <buffer> h         :call CommandDispatcher('lcdUpper')<CR>
	nnoremap <buffer> H         :call CommandDispatcher('cdUpper')<CR>
	nnoremap <buffer> l         :call CommandDispatcher('lcdLast')<CR>
	nnoremap <buffer> L         :call CommandDispatcher('cdLast')<CR>
	nnoremap <buffer> o         :call CommandDispatcher('openDir')<CR>
	nnoremap <buffer> a         :call CommandDispatcher('openByApp')<CR>
	nnoremap <buffer> cp        :call CommandDispatcher('copy')<CR>
	nnoremap <buffer> mv        :call CommandDispatcher('move')<CR>
	nnoremap <buffer> rm        :call CommandDispatcher('delete')<CR>
	nnoremap <buffer> mk        :call CommandDispatcher('mkdir')<CR>
	nnoremap <buffer> re        :call CommandDispatcher('renameBuf')<CR>
	nnoremap <buffer> <F5>      :call CommandDispatcher('reload')<CR>
	nnoremap <buffer> p         :call CommandDispatcher('pointOn')<CR>
	vnoremap <buffer> p         :call CommandDispatcher('pointOn')<CR>
	nnoremap <buffer> <S-p>     :call CommandDispatcher('pointOff')<CR>
	vnoremap <buffer> <S-p>     :call CommandDispatcher('pointOff')<CR>
	nnoremap <buffer> <Tab>     :call CommandDispatcher('tab')<CR>
	nnoremap <buffer> gw        <C-w>w
endfunction

function! BufMap_Rename()
	nnoremap <buffer> fix       :call FlexibleFrank2Controller('renameFix')<CR>
endfunction
