"VMailController.vim

source $myScripts/VMail/MailManager.vim
source $myScripts/VMail/Mail.vim
source $myScripts/VMail/Const.vim

augroup autoCmdVMail
	autocmd!
augroup END

autocmd autoCmdVMail BufRead,BufNewFile *.vmail set filetype=vmail
autocmd autoCmdVMail BufEnter titles.vmail call BufMap_Titles()

function! VMailController(mode)

python <<EOM
# -*- coding:utf-8 -*-

head = vim.eval('$myScripts') + '/VMail/WorkingTexts/'
titlesPath = os.path.abspath(head + 'titles.vmail')
mainPath = os.path.abspath(head + 'main.vmail')

mode = vim.eval('a:mode')

if mode == 'new':
	mailManager = MailManager(142, 143)
	Tab.expandTwoHorizontally(titlesPath, Tab.CLEAR, mainPath, Tab.CLEAR, titlesPath)
	mailManager.outputTitleList()

elif mode == 'reed':
	mailManager.outputMain(Cursor.getCursorLineNum())

EOM

endfunction

function! BufMap_Titles()
	nnoremap <buffer> <CR> :call VMailController('reed')<CR>
endfunction
