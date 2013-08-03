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
set lines=80 --mac
set columns=250 --mac

"日本語入力のときにカーソルを赤くする
hi CursorIM guifg=black guibg=red gui=NONE ctermfg=black ctermbg=white cterm=reverse

" ----------------------------------------------------------------------------------------------------
" 
" 諸パスだよ
"
" ----------------------------------------------------------------------------------------------------
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
let $ahk     = "D:/MyDocument/AutoHotKeys" --win
let $ahkini  = "C:/Program Files/AutoHotkey/AutoHotkeyU64.ahk" --win

"account
let $account = "D:/MyDocument/account" --win

"KeyRemap4MacBook
let $private = "/Users/ryo/Library/Application Support/KeyRemap4MacBook/private.xml" --mac

"tmp
let $tmp = "D:/MyDocument/tmp"         --win
let $tmp = "/Users/ryo/Documents/tmp/" --mac

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
let $presentation = $application . '/presentation'     --mac
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

" ----------------------------------------------------------------------------------------------------
" 
" 自動コマンド
"
" ----------------------------------------------------------------------------------------------------
"文字コードの設定
autocmd BufNew * set fileencoding=utf8 --win

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
nmap <C-S-h> ^--mac

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

" ----------------------------------------------------------------------------------------------------
" 
" winとmacのコマンドの物理配置を同じにするよ
"
" ----------------------------------------------------------------------------------------------------
"ビジュアル矩形
nnoremap <M-S-v> <C-S-v> --win

"インクリメント
nnoremap <M-a> <C-a>--win

"デクリメント
nnoremap <M-x> <C-x>--win

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
nnoremap <sid>(command-line-enter) q: --win
nnoremap <sid>(command-line-enter) q: --mac
nmap <M-:>  <sid>(command-line-enter) --win
nmap '      <sid>(command-line-enter) --mac

"補完
inoremap <M-CR>   <C-p>--win
inoremap <S-M-CR> <C-n>--win
inoremap <C-CR>   <C-p>--mac
inoremap <S-C-CR> <C-n>--mac

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

nnoremap <S-M-CR> :FF ./<CR> --win
nnoremap <S-C-CR> :FF ./<CR> --mac

command! -nargs=1 -complete=dir FF call FlexibleFrankController(<f-args>)

"NotCareExtension
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
