source $myScripts/sample/Sample.vim

function! SampleController()

python <<EOM
obj1 = Sample()

print obj1.string
print Sample.string
EOM

endfunction
