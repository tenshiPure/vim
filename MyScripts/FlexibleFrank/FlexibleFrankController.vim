"FlexibleFrank.vim

source $MyScripts/FlexibleFrank/CommandDispatcher.vim
source $MyScripts/FlexibleFrank/CommandFactory.vim

source $MyScripts/FlexibleFrank/Entry/BaseEntry.vim
source $MyScripts/FlexibleFrank/Entry/BaseManager.vim
source $MyScripts/FlexibleFrank/Entry/GrepEntry.vim
source $MyScripts/FlexibleFrank/Entry/GrepManager.vim
source $MyScripts/FlexibleFrank/Entry/NormalEntry.vim
source $MyScripts/FlexibleFrank/Entry/NormalManager.vim

source $MyScripts/FlexibleFrank/Command/CommandBase.vim
source $MyScripts/FlexibleFrank/Command/Prev.vim
source $MyScripts/FlexibleFrank/Command/Edit.vim
source $MyScripts/FlexibleFrank/Command/ChangeDir.vim
source $MyScripts/FlexibleFrank/Command/ChangeDirUpper.vim
source $MyScripts/FlexibleFrank/Command/ChangeDirBefore.vim
source $MyScripts/FlexibleFrank/Command/OpenByApp.vim
source $MyScripts/FlexibleFrank/Command/OpenDir.vim
source $MyScripts/FlexibleFrank/Command/Copy.vim
source $MyScripts/FlexibleFrank/Command/Move.vim
source $MyScripts/FlexibleFrank/Command/Remove.vim
source $MyScripts/FlexibleFrank/Command/Mkdir.vim
source $MyScripts/FlexibleFrank/Command/Reed.vim
source $MyScripts/FlexibleFrank/Command/Rename.vim
source $MyScripts/FlexibleFrank/Command/PointOn.vim
source $MyScripts/FlexibleFrank/Command/PointOff.vim
source $MyScripts/FlexibleFrank/Command/Fix.vim
source $MyScripts/FlexibleFrank/Command/GetModeSwitch.vim
source $MyScripts/FlexibleFrank/Command/Grep.vim
source $MyScripts/FlexibleFrank/Command/QuickLook.vim

source $MyScripts/FlexibleFrank/Exception/TargetNotFileOnlyException.vim
source $MyScripts/FlexibleFrank/Exception/TargetNotDirException.vim
source $MyScripts/FlexibleFrank/Exception/TargetNotFileException.vim
source $MyScripts/FlexibleFrank/Exception/DestinationNotDirException.vim
source $MyScripts/FlexibleFrank/Exception/NotPoiontedException.vim
source $MyScripts/FlexibleFrank/Exception/NotMatchEntryNumbersException.vim
source $MyScripts/FlexibleFrank/Exception/NotExecutedFrankNException.vim
source $MyScripts/FlexibleFrank/Exception/NotExecutedBeforeFixCommandException.vim
source $MyScripts/FlexibleFrank/Exception/NoMoreBeforeDirException.vim

augroup autoCmdFrank
	autocmd!
augroup END

autocmd autoCmdFrank BufRead,BufNewFile *.frank set filetype=frank
autocmd autoCmdFrank FocusLost *.frank :call CommandDispatcher('Close')
autocmd autoCmdFrank TabLeave *.frank :call CommandDispatcher('Close')
autocmd autoCmdFrank BufEnter Frank1.frank call BufMap_Frank()
autocmd autoCmdFrank BufEnter Frank2.frank call BufMap_Frank()

function! FlexibleFrankController(targetDir)

python <<EOM

import vim
import os

targetDir = os.path.abspath(vim.eval('a:targetDir'))

workingDir = vim.eval('$MyScripts') + '/FlexibleFrank/WorkingTexts/'
pathFrank1 = os.path.abspath(workingDir + 'Frank1.frank')
pathFrank2 = os.path.abspath(workingDir + 'Frank2.frank')
pathFrank3 = os.path.abspath(workingDir + 'Frank3.frank')

Tab.expandReverseT(pathFrank1, pathFrank2, pathFrank3, 9)

frank = NormalManager(targetDir, pathFrank1)
frank.outputFrank()

Tab.switchTab(pathFrank1, 3)

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
	nnoremap <buffer> rm    :call CommandDispatcher('Remove')<CR>
	vnoremap <buffer> rm    :call CommandDispatcher('Remove')<CR>
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
	nnoremap <buffer> q     :call CommandDispatcher('QuickLook')<CR>
endfunction
