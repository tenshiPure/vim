"SurrounderController.vim

source $myScripts/Surrounder/Surrounder.vim

function! SurrounderController(surroundString)

python <<EOM

surroundString = vim.eval('a:surroundString')

surrounder = Surrounder(surroundString)
surrounder.replace()

EOM

endfunction
