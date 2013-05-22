"FlexibleCommentController

source $myScripts/MyLib/MyString.vim
source $myScripts/MyLib/MyFile.vim

source $myScripts/FlexibleComment/FlexibleComment.vim
source $myScripts/FlexibleComment/CommentStyle.vim

function! FlexibleCommentController(mode) range

python <<EOM
import vim

extension = MyFile.getExtension()
mode = vim.eval('a:mode')
firstLine = vim.eval('a:firstline')
lastLine = vim.eval('a:lastline')

FlexibleComment(extension, mode, firstLine, lastLine).execute()

EOM

endfunction
