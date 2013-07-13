"VMailController.vim

source $myScripts/VMail/MailManager.vim
source $myScripts/VMail/Mail.vim
source $myScripts/VMail/Const.vim

function! VMailController()

python <<EOM
# -*- coding:utf-8 -*-

head = vim.eval('$myScripts') + '/VMail/WorkingTexts/'
titlesPath = os.path.abspath(head + 'hoge.vmail')

mailManager = MailManager(142, 143)
titles = mailManager.getTitles()

vim.command('tabedit %s' % titlesPath)

buf = vim.current.buffer
buf.append(titles[0])
buf.append(titles[1])
EOM

endfunction
