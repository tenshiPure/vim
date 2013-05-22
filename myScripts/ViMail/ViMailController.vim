"ViMail.vim

"source $myScripts/MyLib/MyString.vim

source $myScripts/ViMail/ViMail.vim

"augroup autoCmdFrank
	"autocmd!
"augroup END

"autocmd autoCmdFrank BufEnter RenameWorkingText.frank call SetBufLocalMapping()

function! ViMailController()

python <<EOM

viMail = ViMail()

viMail.execute()

EOM

endfunction

"function! SetBufLocalMapping()
	"nnoremap <buffer> p   :call FlexibleFrankController('pointOn')<CR>
"endfunction
