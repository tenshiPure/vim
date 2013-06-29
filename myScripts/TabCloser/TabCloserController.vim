"TabCloserController.vim

source $myScripts/TabCloser/TabCloser.vim

function! TabCloserController()

python <<EOM
TabCloser().execute()
EOM

endfunction
