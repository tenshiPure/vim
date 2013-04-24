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
firstLine = vim.eval('a:firstline')
lastLine = vim.eval('a:lastline')

FlexibleComment(extension, mode, firstLine, lastLine).execute()

EOM

endfunction
