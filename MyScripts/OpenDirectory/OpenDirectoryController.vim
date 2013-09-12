"WordYankController.vim

source $MyScripts/OpenDirectory/OpenDirectory.vim

function! OpenDirectoryController(path)

python <<EOM
openDirectory = OpenDirectory(vim.eval('a:path'))
openDirectory.execute()
EOM
endfunction
