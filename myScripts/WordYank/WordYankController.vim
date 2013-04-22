"WordYankController.vim

source $myScripts/myLib/myCursor.vim

source $myScripts/WordYank/WordYank.vim

function! WordYankController()

python <<EOM
WordYank().execute()
EOM

endfunction
