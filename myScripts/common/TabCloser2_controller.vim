"TabCloser2_Controller.vim

source $myScripts/common/TabCloser2.vim

function! TabCloser2_Controller()

python <<EOM
TabCloser2().execute()
EOM

endfunction
