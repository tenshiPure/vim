"MakeExecuter

"EchoHeader.vim
"時間と実行コマンドをヘッダとして出力する

function! EchoHeader(cmd)

	execute "normal G"
	execute ":normal A------------------------------------------------------------\<ENTER>"
	execute ":normal A" . strftime("%m/%d %H:%M:%S") . "             " . a:cmd . "\<ENTER>"
	execute ":normal A------------------------------------------------------------\<ENTER>"

endfunction
