"FlexibleCommentController

function! FlexibleCommentController2(mode) range

source ./FlexibleComment2.vim
source ./CommentStyle.vim

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
