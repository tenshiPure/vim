source $myScripts/Translator/Translator.vim
source $myScripts/Translator/ParamAnalysis.vim
source $myScripts/Translator/ResultOutputer.vim
source $myScripts/Translator/Const.vim

augroup autoCmdTranslator
	autocmd!
augroup END

autocmd autoCmdTranslator BufRead,BufNewFile *.trs set filetype=trs

autocmd autoCmdTranslator BufEnter *.trs call BufMap_Translator()

function! TranslatorController(mode)

python <<EOM

import vim

mode = vim.eval('a:mode')

head = vim.eval('$myScripts')
ja_trs = os.path.abspath(head + '/Translator/TrsFiles/ja.trs')
en_trs = os.path.abspath(head + '/Translator/TrsFiles/en.trs')

if mode == 'new':
	Tab.expandTwoHorizontally(ja_trs, en_trs, ja_trs)

elif mode == 'execute':
	translator = Translator(ParamAnalysis.getFrom(), ParamAnalysis.getTo(), ParamAnalysis.getText())
	result = translator.execute()

	ResultOutputer.toBuffer(result)

EOM

endfunction

function! BufMap_Translator()
	nnoremap <buffer> <CR>  :call TranslatorController('execute')<CR>
endfunction

