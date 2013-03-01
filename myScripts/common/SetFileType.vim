"common

"SetFileType.vim
"ファイルを開くときに、ファイルタイプを設定する

function! SetFileType()

	"拡張子の取得
	let extension = expand("%:e")

	"拡張子のみで判断出来ない場合、フルパスを参考に設定する
	if extension == 'php'

		let fullpath = expand("%:p")

		"SeLF
		if match(fullpath, 'SeLF') != -1
			set filetype=php.SeLF

		"meisai
		elseif match(fullpath, 'meisai') != -1
			set filetype=php.meisai

		"botch
		elseif match(fullpath, 'dir88') != -1
			set filetype=php.botch

		"php
		else
			set filetype=php

		endif
	endif

endfunction



autocmd BufRead,BufNewFile * call SetFileType()
