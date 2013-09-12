"WordYankController.vim

source $MyScripts/WordYank/WordYank.vim

function! WordYankController(mode)

python <<EOM
wordYank = WordYank()
if vim.eval('a:mode') == 'yank':
	wordYank.yank()
else:
	wordYank.paste()
EOM

endfunction
