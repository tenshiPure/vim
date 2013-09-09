
"----------------------------------------------------------------------------------------------------
"
"環境判定だ�~H
"別ファイルでPC単位で分け�~K
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
"エディタの基本設定だ�~H
"
"----------------------------------------------------------------------------------------------------
"行番号の表示
set number

"タブ幅の設�~Z
set tabstop=4

"<<, >> でシフトする幅の設�~Z
set shiftwidth=4

"保存していなくても別のバッファに移れる
set hidden

"クリップボードを共�~I
set clipboard=unnamed

"スワップファイルを作成しな�~D
set noswapfile

"バックアップファイルを作成しな�~D
set nobackup

"インフォファイルを作成しな�~D
set viminfo=

"折り返さな�~D
autocmd BufWinEnter * set nowrap

"インクリメント・デクリメントを10進数で行う
autocmd BufWinEnter * set nrformats=

"自動で改行しな�~D
autocmd BufWinEnter * set textwidth=0

"マークをリセット
autocmd BufWinEnter * delmarks!

"文字コード設�~Z
if os == 'win'
	autocmd BufWinEnter * set fileencoding=utf8 
endif

"----------------------------------------------------------------------------------------------------
"
"エディタの表示設定だ�~H
"
"----------------------------------------------------------------------------------------------------
"ツールバー非表示
set guioptions-=T

"メニューバー非表示
set guioptions-=m

"日本語入力のときにカーソルを赤くす�~K
hi CursorIM guifg=black guibg=red gui=NONE ctermfg=black ctermbg=white cterm=reverse

"----------------------------------------------------------------------------------------------------
"
"諸パスだ�~H
"
"----------------------------------------------------------------------------------------------------
"gitvim
if os == 'win'
	let $gitvim = $vim . '/gitvim' 
endif
if os == 'mac'
	let $gitvim = '/Users/ryo/Documents/gitvim' 
endif

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
if os == 'win'
	let $ahk     = "D:/MyDocument/AutoHotKeys"
endif
if os == 'win'
	let $ahkini  = "C:/Program Files/AutoHotkey/AutoHotkeyU64.ahk"
endif

"account
if os == 'win'
	let $account = "D:/MyDocument/account"
endif

"KeyRemap4MacBook
if os == 'mac'
	let $private = "/Users/ryo/Library/Application Support/KeyRemap4MacBook/private.xml"
endif

"tmp
if os == 'win'
	let $tmp = "D:/MyDocument/tmp"        
endif
if os == 'mac'
	let $tmp = "/Users/ryo/Documents/tmp/"
endif

"share
if os == 'win'
	let $share = 'D:/Dropbox/share'         
endif
if os == 'mac'
	let $share = '/Users/ryo/Dropbox/share' 
endif

"todo
let $todo = $share . '/todo.txt'

"slf
if os == 'mac'
	let $slf = '/Users/ryo/Documents/projects/slf'         
endif

if os == 'mac'
	let $application  = $slf . '/application'              
endif
if os == 'mac'
	let $controllers  = $application . '/controllers'      
endif
if os == 'mac'
	let $domain       = $application . '/domain'           
endif
if os == 'mac'
	let $models       = $application . '/models'           
endif
if os == 'mac'
	let $transfer     = $application . '/transfer'         
endif
if os == 'mac'
	let $scripts      = $application . '/views/pc/scripts' 
endif
if os == 'mac'
	let $css          = $slf . '/htdocs/css'               
endif
if os == 'mac'
	let $js           = $slf . '/htdocs/js'                
endif
if os == 'mac'
	let $testdata     = $slf . '/testdata'                 
endif
if os == 'mac'
	let $tests        = $slf . '/tests'                    
endif

"slf2-api
if os == 'mac'
	let $api = '/Users/ryo/Documents/projects/slf2-api'    
endif

"slf-log
if os == 'mac'
	let $uilog  = $slf . '/data/logs/application' 
endif
if os == 'mac'
	let $apilog = '/var/log/ap/slmctl' 
endif

"TaskBoard
let $task = "D:/MyDocument/Program/TaskBoard"

"HiredGirl
let $hired = "D:/MyDocument/Program/HiredGirl"

"Pycel
let $pycel = "D:/MyDocument/Program/Pycel"

"----------------------------------------------------------------------------------------------------
"
"移動操作のマッピングだ�~H
"
"----------------------------------------------------------------------------------------------------
"Shift 追加で小ジャン�~W
nnoremap <S-k> 10<UP>
vnoremap <S-k> 10<UP>

nnoremap <S-j> 10<DOWN>
vnoremap <S-j> 10<DOWN>

nnoremap <S-h> 10<LEFT>
vnoremap <S-h> 10<LEFT>

nnoremap <S-l> 10<RIGHT>
vnoremap <S-l> 10<RIGHT>

"行の先頭へ移�~U
if os == 'mac'
	nmap <C-S-h> ^
endif

"----------------------------------------------------------------------------------------------------
"
"挿入モード時のマッピングだ�~H
"
"----------------------------------------------------------------------------------------------------
"Emacsコマンドで移�~U
if os == 'win'
	inoremap <C-p> <UP>
endif
if os == 'win'
	inoremap <C-n> <DOWN>
endif
if os == 'win'
	inoremap <C-b> <LEFT>
endif
if os == 'win'
	inoremap <C-f> <RIGHT>
endif
if os == 'win'
	inoremap <C-a> <HOME>
endif
if os == 'win'
	inoremap <C-e> <END>
endif

"Emacsコマンドで削除
if os == 'win'
	inoremap <C-h> <BS>
endif
if os == 'win'
	inoremap <C-d> <Del>
endif
if os == 'win'
	inoremap <C-w> <C-w>
endif
if os == 'win'
	inoremap <C-k> <C-o><S-d>
endif
if os == 'win'
	inoremap <C-u> <C-u>
endif

"インサートモードから戻るときに、日本語入力をオフにする
inoremap <ESC> <ESC>:set iminsert=0<CR>

"補�~L
if os == 'win'
	inoremap <M-CR>   <C-p>
endif
if os == 'win'
	inoremap <S-M-CR> <C-n>
endif
if os == 'mac'
	inoremap <C-CR>   <C-p>
endif
if os == 'mac'
	inoremap <S-C-CR> <C-n>
endif

"挿入モードでノーマルモードにな�~K
if os == 'win'
	inoremap <C-o> <C-o>
endif

"----------------------------------------------------------------------------------------------------
"
"選択モードのマッピングだ�~H
"
"----------------------------------------------------------------------------------------------------
"全選�~^
vnoremap , <ESC>ggVG

"ビジュアル矩形のキーマッ�~W
if os == 'win'
	nnoremap <M-S-v> <C-S-v> 
endif
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
"バッファ操作のマッピングだ�~H
"
"----------------------------------------------------------------------------------------------------
"左右のタブ移�~U
nnoremap <Space> gt
nnoremap <S-Space> gT

"新規タブを開く
if os == 'win'
	nnoremap <M-Space> :tabedit 
endif
if os == 'mac'
	nnoremap <C-Space> :tabedit 
endif

"バッファを閉じる
if os == 'win'
	nnoremap <C-Space> :call TabClose()<CR> 
endif
if os == 'mac'
	nnoremap <D-Space> :call TabClose()<CR> 
endif

function! TabClose()
python <<EOM
Tab.close()
EOM
endfunction

"ウィンドウ切り替�~H
nnoremap <Tab>   <C-w>w
nnoremap <S-Tab> <C-w>W
nnoremap gw      <C-w>w
nnoremap gW      <C-w>W

"----------------------------------------------------------------------------------------------------
"
"コマンドラインに関するマッピングだ�~H
"
"----------------------------------------------------------------------------------------------------
"コマンドラインモードへ移行す�~K
if os == 'win'
	nnoremap <sid>(command-line-enter) q: 
endif
if os == 'mac'
	nnoremap <sid>(command-line-enter) q: 
endif
if os == 'win'
	nmap <M-:>  <sid>(command-line-enter) 
endif
if os == 'mac'
	nmap '      <sid>(command-line-enter) 
endif

"直前のコマンド履歴を表示
if os == 'win'
	nnoremap <C-p> :<UP>
endif

"<C-p/n>でも履歴のフィルタリング
if os == 'win'
	cnoremap <C-p> <UP>
endif
if os == 'win'
	cnoremap <C-n> <DOWN>
endif

"%%で編集バッファの格納パスを展開する
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

"##で文字列「normal」を展開する
cnoremap ## normal 

"タブを４スペースに置�~[
command! Tabrep %s/\t/    /g

"----------------------------------------------------------------------------------------------------
"
"マーク関係のマッピングだ�~H
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

"任意のマークへ移�~U
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
"自作プラグインの読込とキーマップだ�~H
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

if os == 'win'
	nnoremap <S-M-CR> :FF ./<CR> 
endif
if os == 'mac'
	nnoremap <S-C-CR> :FF ./<CR> 
endif

command! -nargs=1 -complete=dir FF call FlexibleFrankController(<f-args>)

"--------------------------------------------------
"NotCareExtension
"--------------------------------------------------
source $myScripts/NotCareExtension/NotCareExtensionController.vim

if os == 'win'
	nnoremap <M-/>  :call NotCareExtensionController('commentAdd')<CR>    
endif
if os == 'win'
	vnoremap <M-/>  :call NotCareExtensionController('commentAdd')<CR>    
endif
if os == 'win'
	nnoremap ?      :call NotCareExtensionController('commentDelete')<CR> 
endif
if os == 'win'
	vnoremap ?      :call NotCareExtensionController('commentDelete')<CR> 
endif
if os == 'win'
	nnoremap <M-?>  :call NotCareExtensionController('commentSwitch')<CR> 
endif
if os == 'win'
	vnoremap <M-?>  :call NotCareExtensionController('commentSwitch')<CR> 
endif

if os == 'mac'
	nnoremap <C-F6> :call NotCareExtensionController('commentAdd')<CR>    
endif
if os == 'mac'
	vnoremap <C-F6> :call NotCareExtensionController('commentAdd')<CR>    
endif
if os == 'mac'
	nnoremap ?      :call NotCareExtensionController('commentDelete')<CR> 
endif
if os == 'mac'
	vnoremap ?      :call NotCareExtensionController('commentDelete')<CR> 
endif
if os == 'mac'
	nnoremap <C-F7> :call NotCareExtensionController('commentSwitch')<CR> 
endif
if os == 'mac'
	vnoremap <C-F7> :call NotCareExtensionController('commentSwitch')<CR> 
endif

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
"ワンアクションコマンドだ�~H
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

"ディレクトリパスを開�~O
source $myScripts/OpenDirectory/OpenDirectoryController.vim
command! -nargs=1 -complete=dir Dir call OpenDirectoryController(<f-args>)

"----------------------------------------------------------------------------------------------------
"
"その他操作のマッピングだ�~H
"
"----------------------------------------------------------------------------------------------------
", -> zz
nnoremap , zz

"* コマンドで移動しな�~D
nnoremap * *Nzz

"redo
nmap <S-u> <C-r>

"ハイライトの無効�~V
nmap <silent><ESC><ESC> :noh<CR>

"インクリメン�~H
if os == 'win'
	nnoremap <M-a> <C-a>
endif

"デクリメン�~H
if os == 'win'
	nnoremap <M-x> <C-x>
endif

"ブラックホールレジスタで削除する
nnoremap <M-d> "_d
vnoremap <M-d> "_d

"----------------------------------------------------------------------------------------------------
"
"環境変数の追�~X
"
"----------------------------------------------------------------------------------------------------
"python
let $path .= ';C:\Python27'

"nose
let $path .= 'C:\Python27\Scripts'