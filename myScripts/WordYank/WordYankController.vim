"WordYankController.vim

source $myScripts/MyLib/MyCursor.vim

source $myScripts/WordYank/WordYank.vim

function! WordYankController()

python <<EOM
WordYank().execute()
EOM

endfunction
