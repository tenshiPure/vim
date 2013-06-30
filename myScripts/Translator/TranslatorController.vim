source $myScripts/Translator/Translator.vim
source $myScripts/Translator/TranslateVal.vim
source $myScripts/Translator/GetAccessTokenVal.vim

augroup autoCmdTranslator
	autocmd!
augroup END

autocmd autoCmdTranslator BufRead,BufNewFile *.trs set filetype=trs

autocmd autoCmdTranslator BufEnter *.trs call BufMap_Translator()

function! TranslatorController(mode)

python <<EOM

import urllib
import urllib2
import json
import re
import vim

mode = vim.eval('a:mode')

head = vim.eval('$myScripts')
ja_trs = os.path.abspath(head + '/Translator/TrsFiles/ja.trs')
en_trs = os.path.abspath(head + '/Translator/TrsFiles/en.trs')

if mode == 'new':
	Tab.expandTwoHorizontally(ja_trs, en_trs, ja_trs)

elif mode == 'execute':
	translator = Translator()
	translator.execute()

EOM

endfunction

function! BufMap_Translator()
	nnoremap <buffer> <CR>  :call TranslatorController('execute')<CR>
	inoremap <buffer> <CR>  <ESC>:call TranslatorController('execute')<CR>
endfunction
