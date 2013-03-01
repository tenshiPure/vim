"MakeExecuter

"MakeExecuter.vim
"make コマンドの実行と結果出力

"関連ファイルの読み込み
source $myScripts/common/TabFocus.vim
source $myScripts/MakeExecuter/EchoHeader.vim
source $myScripts/MakeExecuter/EchoFooter.vim

"環境変数に追加
if has('win32')
	let $PATH .= "C:/Program Files (x86)/GnuWin32/bin"
endif

".me を開いたときに、ファイルタイプを設定する
autocmd BufRead,BufNewFile *.me set filetype=me

"直前の実行ファイルのファイルタイプ
let s:last_file_type = ''

function! MakeExecuter(file_type, command)

	"作業ファイルでの実行は、前回のファイルタイプを使う
	if a:file_type == 'nroff' || a:file_type == 'me'
		let file_type = s:last_file_type
	else
		let file_type = a:file_type
	endif

	"結果出力ファイルのパス
	set makeef="$myScripts/MakeExecuter/Working_Text.me"

	"作業テキストを編集タブにする
	call TabFocus(expand("$myScripts/MakeExecuter/Working_Text.me"))

	"ヘッダ出力
	call EchoHeader(a:command)
	
	"filetype から使用するmakefile を判断し、make コマンドを作成する
	let exec_cmd = MakeDispatcher(file_type, a:command)

	"make系コマンド実行
	execute ":silent r !" . exec_cmd

	"フッタ出力
	call EchoFooter()

	"今回のファイルタイプを残す
	let s:last_file_type = file_type

endfunction

function! MakeDispatcher(file_type, command)

	let makefile_path = 'dummy'

	"使用makefile のパス指定
	if a:file_type == 'java'
		let makefile_path = $share . '/vim/MakeFile/MakeFile_' . a:file_type

	elseif a:file_type == 'php.SeLF'
		let makefile_path = $share . '/vim/MakeFile/MakeFile_SeLF'

	elseif a:file_type == 'php.meisai'
		let makefile_path = $share . '/vim/MakeFile/MakeFile_meisai'

	elseif a:file_type == 'php.botch'
		let makefile_path = $share . '/vim/MakeFile/MakeFile_botch'

	endif

	"make コマンド部　（ -f : 使用する makefile を指定するオプション
	let make_cmd = 'make -f ' . makefile_path . ' '

	"実行コマンド
	let exec_cmd = make_cmd . a:command

	return exec_cmd

endfunction
