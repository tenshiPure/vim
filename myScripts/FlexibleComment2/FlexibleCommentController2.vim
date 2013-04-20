"FlexibleCommentController

source $myScripts/FlexibleComment2/FlexibleComment2.vim
source $myScripts/FlexibleComment2/CommentStyle.vim

function! FlexibleCommentController2(mode) range

python <<EOM
import vim
import os.path

root, extension = os.path.splitext(vim.current.buffer.name)
mode = vim.eval('a:mode')
first_line = vim.eval('a:firstline')
last_line = vim.eval('a:lastline')

FlexibleComment2(extension, mode, first_line, last_line).execute()

EOM

endfunction
