"VMailController.vim

source $MyScripts/VMail/MailManager.vim

source $MyScripts/VMail/Mail/Mail.vim
source $MyScripts/VMail/Mail/Title.vim
source $MyScripts/VMail/Mail/Sender.vim
source $MyScripts/VMail/Mail/Date.vim
source $MyScripts/VMail/Mail/Main.vim
source $MyScripts/VMail/Mail/AnalysisException.vim

source $MyScripts/VMail/AccountInfo.vim

augroup autoCmdVMail
	autocmd!
augroup END

autocmd autoCmdVMail BufRead, BufNewFile *.vmail set filetype=vmail
autocmd autoCmdVMail BufEnter simpleInfo.vmail call BufMap_Titles()
autocmd autoCmdVMail CursorMoved simpleInfo.vmail call VMailController('detail')

function! VMailController(mode)

python <<EOM
# -*- coding:utf-8 -*-

workingDir = vim.eval('$MyScripts') + '/VMail/WorkingTexts/'
simpleInfoPath = os.path.abspath(workingDir + 'simpleInfo.vmail')
mainPath       = os.path.abspath(workingDir + 'main.vmail')

mode = vim.eval('a:mode')

if mode == 'new':
	mailManager = MailManager(141, 145)
#	mailManager = MailManager(1, 145)
	Tab.expandTwoHorizontally(simpleInfoPath, Tab.CLEAR, mainPath, Tab.CLEAR, simpleInfoPath)
	mailManager.outputMailList()

elif mode == 'reed':
	mailManager.outputMain(Cursor.getCursorLineNum())

elif mode == 'detail':
	cursorColumnNum = Cursor.getCursorColumnNum()
	if cursorColumnNum < 35:
		target = 'sender'
	elif cursorColumnNum < 89:
		target = 'title'
	else:
		target = 'date'

	mailManager.outputDetail(Cursor.getCursorLineNum(), target)

EOM

endfunction

function! BufMap_Titles()
	nnoremap <buffer> <CR> :call VMailController('reed')<CR>
endfunction
