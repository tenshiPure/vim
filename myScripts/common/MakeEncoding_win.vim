"MakeEncoding_win.vim

"MakeEncoding_win.vim.vim
" Windowsで内部エンコーディングがcp932以外の場合makeのメッセージが化けるのを回避

if has('win32') || has('win64') || has('win95') || has('win16')
  au QuickfixCmdPost make call MakeEncoding_win('cp932')
endif

function! MakeEncoding_win(enc)
  if a:enc == &enc
    return
  endif
  let qflist = getqflist()
  for i in qflist
    let i.text = iconv(i.text, a:enc, &enc)
  endfor
  call setqflist(qflist)
endfunction
