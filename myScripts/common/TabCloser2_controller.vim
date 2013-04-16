"TabCloser2_Controller.vim

function! TabCloser2_Controller()

source ./TabCloser2.vim

python <<EOM
TabCloser2().execute()
EOM

endfunction
