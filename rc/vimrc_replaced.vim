
" ----------------------------------------------------------------------------------------------------
"
" 環境判定だ�~H
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
" エディタの基本設定だ�~H
"
" ----------------------------------------------------------------------------------------------------
"行番号の表示
set number

"タブ幅の設�~Z
set tabstop=4

"<<, >> でシフトする幅の設�~Z
set shiftwidth=4

"保存していなくても別のバッファに移れる
set hidden

"インサートモードから戻るときに、日本語入力をオフにする
inoremap <ESC> <ESC>:set iminsert=0<CR>

"クリップボードを共�~I
set clipboard=unnamed

" ----------------------------------------------------------------------------------------------------
" 
" エディタGUI設定だ�~H
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

"日本語入力のときにカーソルを赤くす�~K
hi CursorIM guifg=black guibg=red gui=NONE ctermfg=black ctermbg=white cterm=reverse

" ----------------------------------------------------------------------------------------------------
" 
" 諸パスだ�~H
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
let $rc          = $gitvim . '/rc/vimrc_non_replace.vim'
let $rc_replaced = $gitvim . '/rc/vimrc_replaced.vim'
let $myScripts   = $gitvim . '/myScripts'
let $lib         = $gitvim . '/MyLib'
let $fundamental = $gitvim . '/MyFundamental'
let $frank       = $gitvim . '/myScripts/FlexibleFrank'
let $cass        = $gitvim . '/myScripts/CommandAssistant'
let $notcare     = $gitvim . '/myScripts/NotCareExtension'

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
	let $presentation = $application . '/presentation'     
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

" ----------------------------------------------------------------------------------------------------
" 
" 自動コマン�~I
"
" ----------------------------------------------------------------------------------------------------
"文字コードの設�~Z
if os == 'win'
	autocmd BufNew * set fileencoding=utf8 
endif

" ----------------------------------------------------------------------------------------------------
" 
" 移動操作のマッピングだ�~H
"
" ----------------------------------------------------------------------------------------------------
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

" ----------------------------------------------------------------------------------------------------
" 
" タブ操作のマッピングだ�~H
"
" ----------------------------------------------------------------------------------------------------
"右のタブへ移�~U
nnoremap <Space> gt

"左のタブへ移�~U
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

" ----------------------------------------------------------------------------------------------------
" 
" winとmacのコマンドの物理配置を同じにする�~H
"
" ----------------------------------------------------------------------------------------------------
"ビジュアル矩形
if os == 'win'
	nnoremap <M-S-v> <C-S-v> 
endif

"インクリメン�~H
if os == 'win'
	nnoremap <M-a> <C-a>
endif

"デクリメン�~H
if os == 'win'
	nnoremap <M-x> <C-x>
endif

" ----------------------------------------------------------------------------------------------------
" 
" ファンクションキーのマッピングだ�~H
"
" ----------------------------------------------------------------------------------------------------
"ヘルプの誤作動防止
nnoremap <F1> <ESC>
inoremap <F1> <ESC>

"vimrc の置換と読み込み
nnoremap <F7> :call ReloadVimrc()<CR>:source $rc_replaced<CR>

" ----------------------------------------------------------------------------------------------------
" 
" その他操作のマッピングだ�~H
"
" ----------------------------------------------------------------------------------------------------
" , -> zz
nnoremap , zz

" * コマンドで移動しな�~D
nnoremap * *N

"redo
nmap <S-u> <C-r>

"ハイライトの無効�~V
nmap <silent><ESC><ESC> :noh<CR>

"全選�~^
vnoremap , <ESC>ggVG

"コマンドラインモードへ移�~L
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

":messagesの省略
command! M messages

" ----------------------------------------------------------------------------------------------------
" 
" 自作プラグインの設定だ�~H
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

nnoremap yy :call WordYankController()<CR>
nnoremap yp ciw<C-r>0<ESC>

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
" 余計なファイルは余計なんだ�~H
"
" ----------------------------------------------------------------------------------------------------
"スワップファイルを作成しな�~D
set noswapfile

"バックアップファイルを作成しな�~D
set nobackup

"インフォファイルを作成しな�~D
set viminfo=

" ----------------------------------------------------------------------------------------------------
" 
" 環境変数の追�~X
"
" ----------------------------------------------------------------------------------------------------
"python
let $path .= ';C:\Python27'

"nose
let $path .= 'C:\Python27\Scripts'



source $myScripts/Translator/TranslatorController.vim
nnoremap <F9> :call TranslatorController('new')<CR>