"VMailController.vim

source $myScripts/VMail/MailManager.vim

source $myScripts/VMail/Mail/Mail.vim
source $myScripts/VMail/Mail/Title.vim
source $myScripts/VMail/Mail/Sender.vim
source $myScripts/VMail/Mail/Date.vim
source $myScripts/VMail/Mail/Main.vim
source $myScripts/VMail/Mail/AnalysisException.vim

source $myScripts/VMail/AccountInfo.vim

augroup autoCmdVMail
	autocmd!
augroup END

autocmd autoCmdVMail BufRead,BufNewFile *.vmail set filetype=vmail
autocmd autoCmdVMail BufEnter simpleInfo.vmail call BufMap_Titles()

function! VMailController(mode)

python <<EOM
# -*- coding:utf-8 -*-

workingDir = vim.eval('$myScripts') + '/VMail/WorkingTexts/'
simpleInfoPath = os.path.abspath(workingDir + 'simpleInfo.vmail')
mainPath       = os.path.abspath(workingDir + 'main.vmail')

mode = vim.eval('a:mode')

if mode == 'new':
#	mailManager = MailManager(22, 24)
	mailManager = MailManager(1, 145)
	Tab.expandTwoHorizontally(simpleInfoPath, Tab.CLEAR, mainPath, Tab.CLEAR, simpleInfoPath)
	mailManager.outputMailList()

elif mode == 'reed':
	mailManager.outputMain(Cursor.getCursorLineNum())

EOM

endfunction

function! BufMap_Titles()
	nnoremap <buffer> <CR> :call VMailController('reed')<CR>
endfunction
