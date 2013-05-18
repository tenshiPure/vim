"FlexibleFrank2.vim

source $myScripts/myLib/myCursor.vim
source $myScripts/myLib/myTab.vim
source $myScripts/myLib/myString.vim

source $myScripts/TabCloser/TabCloserController.vim

source $myScripts/FlexibleFrank2/EntryManager.vim
source $myScripts/FlexibleFrank2/Entry.vim

source $myScripts/FlexibleFrank2/command/Helper.vim
source $myScripts/FlexibleFrank2/command/Edit.vim
source $myScripts/FlexibleFrank2/command/ChangeDir.vim
source $myScripts/FlexibleFrank2/command/Explorer.vim
source $myScripts/FlexibleFrank2/command/Copy.vim
source $myScripts/FlexibleFrank2/command/Move.vim
source $myScripts/FlexibleFrank2/command/Delete.vim
source $myScripts/FlexibleFrank2/command/Mkdir.vim
source $myScripts/FlexibleFrank2/command/Rename.vim

augroup autoCmdFrank2
	autocmd!
augroup END

"autocmd autoCmdFrank2 BufRead,BufNewFile *.frank2 set filetype=frank2
"
"autocmd autoCmdFrank2 FocusLost *.frank2 :call FlexibleFrank2Controller('close')
"autocmd autoCmdFrank2 TabLeave *.frank2 :call FlexibleFrank2Controller('close')
"
"autocmd autoCmdFrank2 BufEnter WorkingText.frank2 call BufMap_Frank2()
"autocmd autoCmdFrank2 BufEnter MoreWorkingText.frank2 call BufMap_Frank2()
"autocmd autoCmdFrank2 BufEnter RenameWorkingText.frank2 call BufMap_Frank2_Rename()

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
#frank2.initWorkingText()
#frank2.outputEntries()

#elif mode == 'close':
#	tabCloser = TabCloser()
#	tabCloser.execute()

#elif mode == 'reload':
#	frank.reloadFrank()

#elif mode == 'pointOn':
#	frank.pointOn(int(firstLine), int(lastLine))

#elif mode == 'pointOff':
#	frank.pointOff(int(firstLine), int(lastLine))

#elif mode == 'edit':
#	Edit.execute(frank)

#elif mode == 'openDir':
#	Explorer.openDir(frank)

#elif mode == 'openByApp':
#	Explorer.openByApp(frank)

#elif mode == 'lcd':
#	ChangeDir.cd(frank, 'local')

#elif mode == 'cd':
#	ChangeDir.cd(frank)

#elif mode == 'lcdUpper':
#	ChangeDir.cdUpper('local')

#elif mode == 'cdUpper':
#	ChangeDir.cdUpper()

#elif mode == 'lcdLast':
#	ChangeDir.cdLast('local')

#elif mode == 'cdLast':
#	ChangeDir.cdLast()

#elif mode == 'tab':
#	if frank.single:
#		frank.moreFrank()
#	else:
#		myTab.changeWindow()

#elif mode == 'copy':
#	Copy.execute(frank)

#elif mode == 'move':
#	Move.execute(frank)

#elif mode == 'delete':
#	Delete.execute(frank)

#elif mode == 'mkdir':
#	Mkdir.execute(frank)

#elif mode == 'renameBuf':
#	Rename.renameBuf(frank)

#elif mode == 'renameFix':
#	Rename.renameFix()

EOM

endfunction

function! BufMap_Frank2()
	nnoremap <buffer> e         :call FlexibleFrank2Controller('edit')<CR>
	nnoremap <buffer> m         :call FlexibleFrank2Controller('lcd')<CR>
	nnoremap <buffer> M         :call FlexibleFrank2Controller('cd')<CR>
	nnoremap <buffer> h         :call FlexibleFrank2Controller('lcdUpper')<CR>
	nnoremap <buffer> H         :call FlexibleFrank2Controller('cdUpper')<CR>
	nnoremap <buffer> l         :call FlexibleFrank2Controller('lcdLast')<CR>
	nnoremap <buffer> L         :call FlexibleFrank2Controller('cdLast')<CR>
	nnoremap <buffer> o         :call FlexibleFrank2Controller('openDir')<CR>
	nnoremap <buffer> a         :call FlexibleFrank2Controller('openByApp')<CR>
	nnoremap <buffer> cp        :call FlexibleFrank2Controller('copy')<CR>
	nnoremap <buffer> mv        :call FlexibleFrank2Controller('move')<CR>
	nnoremap <buffer> rm        :call FlexibleFrank2Controller('delete')<CR>
	nnoremap <buffer> mk        :call FlexibleFrank2Controller('mkdir')<CR>
	nnoremap <buffer> re        :call FlexibleFrank2Controller('renameBuf')<CR>
	nnoremap <buffer> <F5>      :call FlexibleFrank2Controller('reload')<CR>
	nnoremap <buffer> p   :call FlexibleFrank2Controller('pointOn')<CR>
	vnoremap <buffer> p   :call FlexibleFrank2Controller('pointOn')<CR>
	nnoremap <buffer> <S-p> :call FlexibleFrank2Controller('pointOff')<CR>
	vnoremap <buffer> <S-p> :call FlexibleFrank2Controller('pointOff')<CR>
	nnoremap <buffer> <Tab> :call FlexibleFrank2Controller('tab')<CR>
	nnoremap <buffer> gw <C-w>w
endfunction

function! BufMap_Frank2_Rename()
	nnoremap <buffer> fix       :call FlexibleFrank2Controller('renameFix')<CR>
endfunction
