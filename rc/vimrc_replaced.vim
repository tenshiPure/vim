
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
" エディタの基本的な設定だ�~H
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

"日本語入力のときにカーソルを赤くす�~K
hi CursorIM guifg=black guibg=red gui=NONE ctermfg=black ctermbg=white cterm=reverse

"インサートモードから戻るときに、日本語入力をオフにする
inoremap <ESC> <ESC>:set iminsert=0<CR>

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

"クリップボードかな
set clipboard=unnamed

"文字コードの設�~Z
if os == 'win'
	autocmd BufNew * set fileencoding=utf8 
endif

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

"share
if os == 'win'
	let $share = 'D:/Dropbox/share'         
endif
if os == 'mac'
	let $share = '/Users/ryo/Dropbox/share' 
endif

"vimrc_non_replace.vim
let $rc = $gitvim . '/rc/vimrc_non_replace.vim'

"vimrc_replaced.vim
let $rc_replaced = $gitvim . '/rc/vimrc_replaced.vim'

"myScripts
let $myScripts  = $gitvim . '/myScripts'

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

"todo
let $todo    = $share . '/todo.txt'

"JAVA
let $java = $share . '/../projects/JAVA'

"mado
let $dir84 = $share . '/../projects/dir84'
let $mado = $share . '/../projects/mado'

"botch
let $dir88 = $share . '/../projects/dir88'

"bomber
if os == 'win'
	let $bomber = 'D:/MyDocument/Program/bomberman' 
endif
if os == 'mac'
	let $bomber = '/Users/ryo/Documents/projects/bomberman' 
endif

"colors
if os == 'win'
	let $colors = 'D:/MyDocument/Program/colors' 
endif
if os == 'mac'
	let $colors = '/Users/ryo/Documents/projects/colors' 
endif

"slf
let $slf = '/Users/ryo/Documents/projects/slf'

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
	let $logs         = $slf . '/data/logs/application'    
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

"タブ（バッファ）を閉じ�~K
if os == 'win'
	nnoremap <C-Space> :call TabCloserController()<CR> 
endif
if os == 'mac'
	nnoremap <D-Space> :call TabCloserController()<CR> 
endif

nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W
" ----------------------------------------------------------------------------------------------------
" 
" その他操作のマッピングだ�~H
"
" ----------------------------------------------------------------------------------------------------
" , -> zz
nnoremap , zz

" * コマンドで移動しな�~D
nnoremap * *N

" cc -> bcw
nnoremap cc bcw

"redo
nmap <S-u> <C-r>

"ハイライトの無効�~V
nmap <silent><ESC><ESC> :noh<CR>

"全選�~^
vnoremap , <ESC>ggVG

"単語をコピー
nnoremap yy :call WordYankController()<CR>

"単語を置換ペース�~H
nnoremap yp ciw<C-r>0<ESC>

"ビジュアル矩形モードの物理キー配置をmac と揃え�~K
if os == 'win'
	nnoremap <M-S-v> <C-S-v> 
endif

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

"コメント操�~\
if os == 'win'
	nnoremap <M-/>  :call FlexibleCommentController('add')<CR>    
endif
if os == 'win'
	vnoremap <M-/>  :call FlexibleCommentController('add')<CR>    
endif
if os == 'win'
	nnoremap ?      :call FlexibleCommentController('delete')<CR> 
endif
if os == 'win'
	vnoremap ?      :call FlexibleCommentController('delete')<CR> 
endif
if os == 'win'
	nnoremap <M-?>  :call FlexibleCommentController('switch')<CR> 
endif
if os == 'win'
	vnoremap <M-?>  :call FlexibleCommentController('switch')<CR> 
endif

if os == 'mac'
	nnoremap <C-F6> :call FlexibleCommentController('add')<CR>    
endif
if os == 'mac'
	vnoremap <C-F6> :call FlexibleCommentController('add')<CR>    
endif
if os == 'mac'
	nnoremap ?      :call FlexibleCommentController('delete')<CR> 
endif
if os == 'mac'
	vnoremap ?      :call FlexibleCommentController('delete')<CR> 
endif
if os == 'mac'
	nnoremap <C-F7> :call FlexibleCommentController('switch')<CR> 
endif
if os == 'mac'
	vnoremap <C-F7> :call FlexibleCommentController('switch')<CR> 
endif

"フランク
if os == 'win'
	nnoremap <S-M-CR> :FF ./<CR> 
endif
if os == 'mac'
	nnoremap <S-C-CR> :FF ./<CR> 
endif
command! -nargs=1 -complete=dir FF call FlexibleFrankController(<f-args>)

"GitAssist
command! G :call GitAssistController('new')

"補完操作のマッピング
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
" 諸プラグインの設定だ�~H
"
" ----------------------------------------------------------------------------------------------------

" ----------------------------------------------------------------------------------------------------
" 
" 自作スクリプトの読み込みだ�~H
"
" ----------------------------------------------------------------------------------------------------
"FlexibleComment
source $myScripts/FlexibleComment/FlexibleCommentController.vim

"FlexibleFrank
source $myScripts/FlexibleFrank/FlexibleFrankController.vim

"WordYank
source $myScripts/WordYank/WordYankController.vim

"ReloadVimrc
source $myScripts/ReloadVimrc/ReloadVimrc.vim

"TabCloser
source $myScripts/TabCloser/TabCloserController.vim

"GitAssist
source $myScripts/GitAssist/GitAssistController.vim

" ----------------------------------------------------------------------------------------------------
" 
" 自動コマン�~I
"
" ----------------------------------------------------------------------------------------------------
autocmd QuickFixCmdPost *grep* cwindow

" ----------------------------------------------------------------------------------------------------
" 
" 環境変数の追�~X
"
" ----------------------------------------------------------------------------------------------------
"python
let $path .= ';C:\Python27'

"nose
let $path .= 'C:\Python27\Scripts'


nnoremap gs  :!git status<CR>
nnoremap gb  :!git branch<CR>
nnoremap gl  :!git log<CR><CR>
nnoremap gco  :!git checkout 
nnoremap ga  :!git add 
nnoremap gcm  :!git commit -m '
nnoremap gpl :!git pull origin 
nnoremap gps :!git push origin 
nnoremap gm  :!git merge 

nnoremap gts :!phpunit --stderr -c /Users/ryo/Documents/projects/slf/tests/phpunit.xml --group=slf /Users/ryo/Documents/projects/slf/tests/application/<CR>
"nnoremap gts :!phpunit --stderr -c /Users/ryo/Documents/projects/slf/tests/phpunit.xml --group=wip /Users/ryo/Documents/projects/slf/tests/application/<CR>


nnoremap <F2> oAppLog::debug(__FILE__, __LINE__, print_r(, true));<ESC>8<LEFT>i



"DBAssist
source $myScripts/MySQLAssist/MySQLAssistController.vim
command! -nargs=+ D call MySQLAssistController(<f-args>)





command! M messages