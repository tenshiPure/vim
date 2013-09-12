source $MyScripts/Surround/Surround.vim

function! SurroundController(mode, ...)

python <<EOM
# -*- coding: utf-8 -*-

import vim

if vim.eval('a:0') != '2':
	print 'ARGUMENT ERROR'

else:
	lineNum = Cursor.getCursorLineNum()

	mode = vim.eval('a:mode')
	if mode == 'last':
		pos = Cursor.getCursorColumnNum()
		target = String.getLineFromCurrentBuffer()[pos - 1:]

	elif mode == 'quick':
		target = String.getUnderCursorWord()

	elif mode == 'visual':
		target = String.getVisualCommandText()

	word = vim.eval('a:1')
	surrounder = vim.eval('a:2')

	surround = Surround(lineNum, target, word, surrounder)
	surround.execute()
	
EOM
endfunction
