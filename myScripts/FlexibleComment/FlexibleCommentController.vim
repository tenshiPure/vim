"FlexibleCommentController

source $myScripts/myLib/myString.vim
source $myScripts/myLib/myFile.vim

source $myScripts/FlexibleComment/FlexibleComment.vim
source $myScripts/FlexibleComment/CommentStyle.vim

function! FlexibleCommentController(mode) range

python <<EOM
import vim

extension = myFile.getExtension()
mode = vim.eval('a:mode')
first_line = vim.eval('a:firstline')
last_line = vim.eval('a:lastline')

FlexibleComment(extension, mode, first_line, last_line).execute()

EOM

endfunction
