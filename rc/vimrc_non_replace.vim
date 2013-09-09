"----------------------------------------------------------------------------------------------------
"
"環境判定だよ
"別ファイルでPC単位で分ける
"
"----------------------------------------------------------------------------------------------------
if has('win32')
    let os = 'win'
endif

if has('mac')
    let os = 'mac'
endif

"----------------------------------------------------------------------------------------------------
"
"エディタの基本設定だよ
"
"----------------------------------------------------------------------------------------------------
"行番号の表示
set number

"タブ幅の設定
set tabstop=4

"<<, >> でシフトする幅の設定
set shiftwidth=4

"保存していなくても別のバッファに移れる
set hidden

"クリップボードを共有
set clipboard=unnamed

"スワップファイルを作成しない
set noswapfile

"バックアップファイルを作成しない
set nobackup

"インフォファイルを作成しない
set viminfo=

"折り返さない
autocmd BufWinEnter * set nowrap

"インクリメント・デクリメントを10進数で行う
autocmd BufWinEnter * set nrformats=

"自動で改行しない
autocmd BufWinEnter * set textwidth=0

"マークをリセット
autocmd BufWinEnter * delmarks!

"文字コード設定
autocmd BufWinEnter * set fileencoding=utf8 --win

"----------------------------------------------------------------------------------------------------
"
"エディタの表示設定だよ
"
"----------------------------------------------------------------------------------------------------
"ツールバー非表示
set guioptions-=T

"メニューバー非表示
set guioptions-=m

"日本語入力のときにカーソルを赤くする
hi CursorIM guifg=black guibg=red gui=NONE ctermfg=black ctermbg=white cterm=reverse

"----------------------------------------------------------------------------------------------------
"
"諸パスだよ
"
"----------------------------------------------------------------------------------------------------
"gitvim
let $gitvim = $vim . '/gitvim' --win
let $gitvim = '/Users/ryo/Documents/gitvim' --mac

"vim
let $ignore      = $gitvim . '/.gitignore'
let $rc          = $gitvim . '/rc/vimrc_non_replace.vim'
let $rc_replaced = $gitvim . '/rc/vimrc_replaced.vim'
let $myScripts   = $gitvim . '/myScripts'
let $lib         = $gitvim . '/MyLib'
let $fundamental = $gitvim . '/MyFundamental'
let $frank       = $gitvim . '/myScripts/FlexibleFrank'
let $cass        = $gitvim . '/myScripts/CommandAssistant'
let $notcare     = $gitvim . '/myScripts/NotCareExtension'
let $trans       = $gitvim . '/myScripts/Translator'
let $vmail       = $gitvim . '/myScripts/vMail'

"AutoHotkeys
let $ahk     = "D:/MyDocument/AutoHotKeys"--win
let $ahkini  = "C:/Program Files/AutoHotkey/AutoHotkeyU64.ahk"--win

"account
let $account = "D:/MyDocument/account"--win

"KeyRemap4MacBook
let $private = "/Users/ryo/Library/Application Support/KeyRemap4MacBook/private.xml"--mac

"tmp
let $tmp = "D:/MyDocument/tmp"        --win
let $tmp = "/Users/ryo/Documents/tmp/"--mac

"share
let $share = 'D:/Dropbox/share'         --win
let $share = '/Users/ryo/Dropbox/share' --mac

"todo
let $todo = $share . '/todo.txt'

"slf
let $slf = '/Users/ryo/Documents/projects/slf'         --mac

let $application  = $slf . '/application'              --mac
let $controllers  = $application . '/controllers'      --mac
let $domain       = $application . '/domain'           --mac
let $models       = $application . '/models'           --mac
let $transfer     = $application . '/transfer'         --mac
let $scripts      = $application . '/views/pc/scripts' --mac
let $css          = $slf . '/htdocs/css'               --mac
let $js           = $slf . '/htdocs/js'                --mac
let $testdata     = $slf . '/testdata'                 --mac
let $tests        = $slf . '/tests'                    --mac

"slf2-api
let $api = '/Users/ryo/Documents/projects/slf2-api'    --mac

"slf-log
let $uilog  = $slf . '/data/logs/application' --mac
let $apilog = '/var/log/ap/slmctl' --mac

"TaskBoard
let $task = "D:/MyDocument/Program/TaskBoard"

"HiredGirl
let $hired = "D:/MyDocument/Program/HiredGirl"

"Pycel
let $pycel = "D:/MyDocument/Program/Pycel"

"----------------------------------------------------------------------------------------------------
"
"移動操作のマッピングだよ
"
"----------------------------------------------------------------------------------------------------
"Shift 追加で小ジャンプ
nnoremap <S-k> 10<UP>
vnoremap <S-k> 10<UP>

nnoremap <S-j> 10<DOWN>
vnoremap <S-j> 10<DOWN>

nnoremap <S-h> 10<LEFT>
vnoremap <S-h> 10<LEFT>

nnoremap <S-l> 10<RIGHT>
vnoremap <S-l> 10<RIGHT>

"行の先頭へ移動
nmap <C-S-h> ^--mac

"----------------------------------------------------------------------------------------------------
"
"挿入モード時のマッピングだよ
"
"----------------------------------------------------------------------------------------------------
"Emacsコマンドで移動
inoremap <C-p> <UP>--win
inoremap <C-n> <DOWN>--win
inoremap <C-b> <LEFT>--win
inoremap <C-f> <RIGHT>--win
inoremap <C-a> <HOME>--win
inoremap <C-e> <END>--win

"Emacsコマンドで削除
inoremap <C-h> <BS>--win
inoremap <C-d> <Del>--win
inoremap <C-w> <C-w>--win
inoremap <C-k> <C-o><S-d>--win
inoremap <C-u> <C-u>--win

"インサートモードから戻るときに、日本語入力をオフにする
inoremap <ESC> <ESC>:set iminsert=0<CR>

"補完
inoremap <M-CR>   <C-p>--win
inoremap <S-M-CR> <C-n>--win
inoremap <C-CR>   <C-p>--mac
inoremap <S-C-CR> <C-n>--mac

"挿入モードでノーマルモードになる
inoremap <C-o> <C-o>--win

"----------------------------------------------------------------------------------------------------
"
"選択モードのマッピングだよ
"
"----------------------------------------------------------------------------------------------------
"全選択
vnoremap , <ESC>ggVG

"ビジュアル矩形のキーマップ
nnoremap <M-S-v> <C-S-v> --win
vnoremap v <C-v>

"選択範囲の文字列を * で検索
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>Nzz

function! s:VSetSearch()
	let temp = @s
	n orm! gv"sy
	let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
	let @s = temp
endfunction

"----------------------------------------------------------------------------------------------------
"
"バッファ操作のマッピングだよ
"
"----------------------------------------------------------------------------------------------------
"左右のタブ移動
nnoremap <Space> gt
nnoremap <S-Space> gT

"新規タブを開く
nnoremap <M-Space> :tabedit --win
nnoremap <C-Space> :tabedit --mac

"バッファを閉じる
nnoremap <C-Space> :call TabClose()<CR> --win
nnoremap <D-Space> :call TabClose()<CR> --mac

function! TabClose()
python <<EOM
Tab.close()
EOM
endfunction

"ウィンドウ切り替え
nnoremap <Tab>   <C-w>w
nnoremap <S-Tab> <C-w>W
nnoremap gw      <C-w>w
nnoremap gW      <C-w>W

"----------------------------------------------------------------------------------------------------
"
"コマンドラインに関するマッピングだよ
"
"----------------------------------------------------------------------------------------------------
"コマンドラインモードへ移行する
nnoremap <sid>(command-line-enter) q: --win
nnoremap <sid>(command-line-enter) q: --mac
nmap <M-:>  <sid>(command-line-enter) --win
nmap '      <sid>(command-line-enter) --mac

"直前のコマンド履歴を表示
nnoremap <C-p> :<UP>--win

"<C-p/n>でも履歴のフィルタリング
cnoremap <C-p> <UP>--win
cnoremap <C-n> <DOWN>--win

"%%で編集バッファの格納パスを展開する
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

"##で文字列「normal」を展開する
cnoremap ## normal 

"タブを４スペースに置換
command! Tabrep %s/\t/    /g

"----------------------------------------------------------------------------------------------------
"
"マーク関係のマッピングだよ
"
"----------------------------------------------------------------------------------------------------
"識別子割り当て
nmap m [mark]
nnoremap [mark] <Nop>

"最後に挿入を抜けた所
nnoremap [mark]k '^

"最後に編集したところ
nnoremap [mark]j '.

"一つ前のマーク
nnoremap [mark]h ['

"一つ先のマーク
nnoremap [mark]l ]'

"マークリストの表示
nnoremap [mark]s :marks<CR>

"任意のマークへ移動
nnoremap [mark]<space> '

if !exists('g:markrement_char')
    let g:markrement_char = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
endif

nnoremap <silent>[mark]m :<C-u>call <SID>AutoMarkrement()<CR>
function! s:AutoMarkrement()
    if !exists('b:markrement_pos')
        let b:markrement_pos = 0
    else
        let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    endif
    execute 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
endfunction

"----------------------------------------------------------------------------------------------------
"
"自作プラグインの読込とキーマップだよ
"
"----------------------------------------------------------------------------------------------------
"--------------------------------------------------
"MyLibs
"--------------------------------------------------
source $gitvim/MyLib/String.vim
source $gitvim/MyLib/Cursor.vim
source $gitvim/MyLib/File.vim
source $gitvim/MyLib/Buffer.vim
source $gitvim/MyLib/Tab.vim

"--------------------------------------------------
"MyFundamentals
"--------------------------------------------------
source $gitvim/MyFundamental/_Buffer.vim

"--------------------------------------------------
"CommandAssistant
"--------------------------------------------------
source $myScripts/CommandAssistant/CommandAssistantController.vim

command! -nargs=? CA  call CommandAssistantController(<f-args>)
command! -nargs=0 CAH call CommandAssistantController('history')

"--------------------------------------------------
"FlexibleFrank
"--------------------------------------------------
source $myScripts/FlexibleFrank/FlexibleFrankController.vim

nnoremap <S-M-CR> :FF ./<CR> --win
nnoremap <S-C-CR> :FF ./<CR> --mac

command! -nargs=1 -complete=dir FF call FlexibleFrankController(<f-args>)

"--------------------------------------------------
"NotCareExtension
"--------------------------------------------------
source $myScripts/NotCareExtension/NotCareExtensionController.vim

nnoremap <M-/>  :call NotCareExtensionController('commentAdd')<CR>    --win
vnoremap <M-/>  :call NotCareExtensionController('commentAdd')<CR>    --win
nnoremap ?      :call NotCareExtensionController('commentDelete')<CR> --win
vnoremap ?      :call NotCareExtensionController('commentDelete')<CR> --win
nnoremap <M-?>  :call NotCareExtensionController('commentSwitch')<CR> --win
vnoremap <M-?>  :call NotCareExtensionController('commentSwitch')<CR> --win

nnoremap <C-F6> :call NotCareExtensionController('commentAdd')<CR>    --mac
vnoremap <C-F6> :call NotCareExtensionController('commentAdd')<CR>    --mac
nnoremap ?      :call NotCareExtensionController('commentDelete')<CR> --mac
vnoremap ?      :call NotCareExtensionController('commentDelete')<CR> --mac
nnoremap <C-F7> :call NotCareExtensionController('commentSwitch')<CR> --mac
vnoremap <C-F7> :call NotCareExtensionController('commentSwitch')<CR> --mac

command! -nargs=? -complete=file W wall | call NotCareExtensionController('make', <f-args>)
command! -nargs=? T   call NotCareExtensionController('test', <f-args>)
command! -nargs=? Log call NotCareExtensionController('log', <f-args>)

"--------------------------------------------------
"ReloadVimrc
"--------------------------------------------------
source $myScripts/ReloadVimrc/ReloadVimrc.vim

nnoremap <F7> :call ReloadVimrc()<CR>:source $rc_replaced<CR>

"--------------------------------------------------
"WordYank
"--------------------------------------------------
source $myScripts/WordYank/WordYankController.vim

nnoremap yy :call WordYankController('yank')<CR>
nnoremap yp :call WordYankController('paste')<CR>

"--------------------------------------------------
"Translator
"--------------------------------------------------
source $myScripts/Translator/TranslatorController.vim

command! -nargs=1 Jts call TranslatorController('arg_ja', <f-args>)
command! -nargs=1 Ets call TranslatorController('arg_en', <f-args>)
command!          Bts call TranslatorController('buffer')
command!          Qts call TranslatorController('quick')
command! -range   Vts call TranslatorController('visual')

"--------------------------------------------------
"VMail
"--------------------------------------------------
source $myScripts/VMail/VMailController.vim

command! Vmail call VMailController('new')

"--------------------------------------------------
"Surround
"--------------------------------------------------
source $myScripts/Surround/SurroundController.vim

command! -nargs=+         Surround call SurroundController('last', <f-args>)
command! -nargs=+        Qsurround call SurroundController('quick', <f-args>)
command! -nargs=+ -range Vsurround call SurroundController('visual', <f-args>)

"----------------------------------------------------------------------------------------------------
"
"ワンアクションコマンドだよ
"
"----------------------------------------------------------------------------------------------------
":messagesの省略
command! M messages

"任意の文字列の出現回数を数える
"範囲選択...
command! -nargs=+ Count call <SID>Count(<f-args>)

function! s:Count(...)
python <<EOM
import vim
argLen = int(vim.eval('a:0'))
args = []
for argNum in range(argLen):
	args.append(vim.eval('a:%s' % str(argNum + 1)))

results = []
for arg in args:
	results.append(0)

for line in vim.current.buffer:
	for argNum in range(argLen):
		results[argNum] += line.count(args[argNum])

for argNum in range(argLen):
	print 'target : %s' % args[argNum]
	print 'result : %d' % results[argNum]
	print ' '
EOM
endfunction

"pythonの文字コードコメントを挿入
command! Pyhead :normal i#-*- coding: utf-8 -*-

"ディレクトリパスを開く
source $myScripts/OpenDirectory/OpenDirectoryController.vim
command! -nargs=1 -complete=dir Dir call OpenDirectoryController(<f-args>)

"----------------------------------------------------------------------------------------------------
"
"その他操作のマッピングだよ
"
"----------------------------------------------------------------------------------------------------
", -> zz
nnoremap , zz

"* コマンドで移動しない
nnoremap * *Nzz

"redo
nmap <S-u> <C-r>

"ハイライトの無効化
nmap <silent><ESC><ESC> :noh<CR>

"インクリメント
nnoremap <M-a> <C-a>--win

"デクリメント
nnoremap <M-x> <C-x>--win

"ブラックホールレジスタで削除する
nnoremap <M-d> "_d
vnoremap <M-d> "_d

"----------------------------------------------------------------------------------------------------
"
"環境変数の追記
"
"----------------------------------------------------------------------------------------------------
"python
let $path .= ';C:\Python27'

"nose
let $path .= 'C:\Python27\Scripts'
