source $myScripts/Translator/Translator.vim
source $myScripts/Translator/ParamAnalysis.vim
source $myScripts/Translator/ResultOutputer.vim
source $myScripts/Translator/Const.vim

augroup autoCmdTranslator
	autocmd!
augroup END

autocmd autoCmdTranslator BufRead,BufNewFile *.trs set filetype=trs

autocmd autoCmdTranslator BufEnter *.trs call BufMap_Translator()

function! TranslatorController(mode, ...)

python <<EOM
# -*- coding: utf-8 -*-

import vim

mode = vim.eval('a:mode')

head = vim.eval('$myScripts')
ja_trs = os.path.abspath(head + '/Translator/TrsFiles/ja.trs')
en_trs = os.path.abspath(head + '/Translator/TrsFiles/en.trs')

if mode == 'buffer':
	Tab.expandTwoHorizontally(ja_trs, en_trs, ja_trs)

elif mode == 'execute':
	translator = Translator(ParamAnalysis.getFrom(), ParamAnalysis.getTo(), ParamAnalysis.getTextFromBuffer())
	result = translator.execute()

	ResultOutputer.toBuffer(result)

elif mode == 'visual':
	translator = Translator('en', 'ja', String.getVisualCommandText())
	result = translator.execute()

	ResultOutputer.toCommandLineArea(result)

elif mode == 'quick':
	translator = Translator('en', 'ja', String.getUnderCursorWord())
	result = translator.execute()

	ResultOutputer.toCommandLineArea(result)

elif mode == 'arg_ja':
	text = String.convert(vim.eval('a:1'), 'vim', 'utf-8')

	translator = Translator('ja', 'en', text)
	result = translator.execute()

	ResultOutputer.toCommandLineArea(result)

elif mode == 'arg_en':
	translator = Translator('en', 'ja', vim.eval('a:1'))
	result = translator.execute()

	ResultOutputer.toCommandLineArea(result)

EOM

endfunction

function! BufMap_Translator()
	nnoremap <buffer> <CR>  :call TranslatorController('execute')<CR>
endfunction
