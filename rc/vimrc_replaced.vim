
" ----------------------------------------------------------------------------------------------------
"
" 環境判定だよ
"
" ----------------------------------------------------------------------------------------------------
if has('win32')
    let os = 'win'
endif

if has('mac')
    let os = 'mac'
endif

" ----------------------------------------------------------------------------------------------------
" 
" エディタの基本設定だよ
"
" ----------------------------------------------------------------------------------------------------
"行番号の表示
set number

"タブ幅の設定
set tabstop=4

"<<, >> でシフトする幅の設定
set shiftwidth=4

"保存していなくても別のバッファに移れる
set hidden

"インサートモードから戻るときに、日本語入力をオフにする
inoremap <ESC> <ESC>:set iminsert=0<CR>

"クリップボードを共有
set clipboard=unnamed

" ----------------------------------------------------------------------------------------------------
" 
" エディタGUI設定だよ
"
" ----------------------------------------------------------------------------------------------------
"ツールバー非表示
set guioptions-=T

"メニューバー非表示
set guioptions-=m

"ウィンドウサイズ変更
if os == 'mac'
	set lines=80 
endif
if os == 'mac'
	set columns=250 
endif

"日本語入力のときにカーソルを赤くする
hi CursorIM guifg=black guibg=red gui=NONE ctermfg=black ctermbg=white cterm=reverse

" ----------------------------------------------------------------------------------------------------
" 
" 諸パスだよ
"
" ----------------------------------------------------------------------------------------------------
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

" ----------------------------------------------------------------------------------------------------
" 
" 自動コマンド
"
" ----------------------------------------------------------------------------------------------------
"文字コードの設定
if os == 'win'
	autocmd BufNew * set fileencoding=utf8 
endif

" ----------------------------------------------------------------------------------------------------
" 
" 移動操作のマッピングだよ
"
" ----------------------------------------------------------------------------------------------------
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
if os == 'mac'
	nmap <C-S-h> ^
endif

" ----------------------------------------------------------------------------------------------------
" 
" タブ操作のマッピングだよ
"
" ----------------------------------------------------------------------------------------------------
"右のタブへ移動
nnoremap <Space> gt

"左のタブへ移動
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

"ウィンドウ切り替え
nnoremap <Tab>   <C-w>w
nnoremap <S-Tab> <C-w>W
nnoremap gw      <C-w>w
nnoremap gW      <C-w>W

" ----------------------------------------------------------------------------------------------------
" 
" winとmacのコマンドの物理配置を同じにするよ
"
" ----------------------------------------------------------------------------------------------------
"ビジュアル矩形
if os == 'win'
	nnoremap <M-S-v> <C-S-v> 
endif

"インクリメント
if os == 'win'
	nnoremap <M-a> <C-a>
endif

"デクリメント
if os == 'win'
	nnoremap <M-x> <C-x>
endif

" ----------------------------------------------------------------------------------------------------
" 
" ファンクションキーのマッピングだよ
"
" ----------------------------------------------------------------------------------------------------
"ヘルプの誤作動防止
nnoremap <F1> <ESC>
inoremap <F1> <ESC>

"vimrc の置換と読み込み
nnoremap <F7> :call ReloadVimrc()<CR>:source $rc_replaced<CR>

" ----------------------------------------------------------------------------------------------------
" 
" その他操作のマッピングだよ
"
" ----------------------------------------------------------------------------------------------------
" , -> zz
nnoremap , zz

" * コマンドで移動しない
nnoremap * *N

"redo
nmap <S-u> <C-r>

"ハイライトの無効化
nmap <silent><ESC><ESC> :noh<CR>

"全選択
vnoremap , <ESC>ggVG

"コマンドラインモードへ移行
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

"補完
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

":messagesの省略
command! M messages

" ----------------------------------------------------------------------------------------------------
" 
" 自作プラグインの設定だよ
"
" ----------------------------------------------------------------------------------------------------
"CommandAssistant
source $myScripts/CommandAssistant/CommandAssistantController.vim

command! -nargs=? CA  call CommandAssistantController(<f-args>)
command! -nargs=0 CAH call CommandAssistantController('history')

"FlexibleFrank
source $myScripts/FlexibleFrank/FlexibleFrankController.vim

if os == 'win'
	nnoremap <S-M-CR> :FF ./<CR> 
endif
if os == 'mac'
	nnoremap <S-C-CR> :FF ./<CR> 
endif

command! -nargs=1 -complete=dir FF call FlexibleFrankController(<f-args>)

"NotCareExtension
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

"ReloadVimrc
source $myScripts/ReloadVimrc/ReloadVimrc.vim

"WordYank
source $myScripts/WordYank/WordYankController.vim

nnoremap yy :call WordYankController('yank')<CR>
nnoremap yp :call WordYankController('paste')<CR>

"MyLibs
source $gitvim/MyLib/String.vim
source $gitvim/MyLib/Cursor.vim
source $gitvim/MyLib/File.vim
source $gitvim/MyLib/Buffer.vim
source $gitvim/MyLib/Tab.vim

"MyFundamentals
source $gitvim/MyFundamental/_Buffer.vim

" ----------------------------------------------------------------------------------------------------
" 
" 余計なファイルは余計なんだよ
"
" ----------------------------------------------------------------------------------------------------
"スワップファイルを作成しない
set noswapfile

"バックアップファイルを作成しない
set nobackup

"インフォファイルを作成しない
set viminfo=

" ----------------------------------------------------------------------------------------------------
" 
" 環境変数の追記
"
" ----------------------------------------------------------------------------------------------------
"python
let $path .= ';C:\Python27'

"nose
let $path .= 'C:\Python27\Scripts'



source $myScripts/Translator/TranslatorController.vim
command! -nargs=1 Jts call TranslatorController('arg_ja', <f-args>)
command! -nargs=1 Ets call TranslatorController('arg_en', <f-args>)
command!          Bts call TranslatorController('buffer')
command!          Qts call TranslatorController('quick')
command! -range   Vts call TranslatorController('visual')




source $myScripts/VMail/VMailController.vim
command! Vmail call VMailController('new')

command! Tabrep %s/\t/    /g



let $khconf = "C:/Users/Administrator/AppData/Roaming/keyhac"

command! Pyhead :normal i#-*- coding: utf-8 -*-

source $myScripts/OpenDirectory/OpenDirectoryController.vim
command! -nargs=1 -complete=dir Dir call OpenDirectoryController(<f-args>)


source $myScripts/Surround/SurroundController.vim
command! -nargs=+         Surround call SurroundController('last', <f-args>)
command! -nargs=+        Qsurround call SurroundController('quick', <f-args>)
command! -nargs=+ -range Vsurround call SurroundController('visual', <f-args>)


let $ryo = '/Users/ryo/Desktop/ryo_controller_tests/'

nnoremap <S-F1> vibdi$testName, $role, $expectedController, $expectedAction, $redirectUrl = null<ESC>
nnoremap <S-F2> ddOif (!is_null($role))<CR>$this->_logined($role);<ESC>
nnoremap <S-F5> o$this->executeAsserting($expectedController, $expectedAction, $redirectUrl);<ESC>
nnoremap <S-F6> ofunction Provider() {<CR>return array(<CR>array('事務局',     array(ActorRole::ORGANIZER),              '', ''),<CR>array('統制NW',     array(ActorRole::OPERATOR_REGULATION_NW), '', ''),<CR>array('全参照',     array(ActorRole::ALL_READ_SLF),           '', ''),<CR>array('アセッサー', array(ActorRole::RISK_ASSESSOR),          '', ''),<CR>array('担当者',     array(ActorRole::SERVICE_TANTO),          '', ''),<CR>array('権限なし',   array(null),                              '', ''),<CR>array('未ログイン', null,                                     '', ''),<CR>);<CR>}<ESC>


