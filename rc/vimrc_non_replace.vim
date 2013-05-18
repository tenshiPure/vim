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
" エディタの基本的な設定だよ
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

"日本語入力のときにカーソルを赤くする
hi CursorIM guifg=black guibg=red gui=NONE ctermfg=black ctermbg=white cterm=reverse

"インサートモードから戻るときに、日本語入力をオフにする
inoremap <ESC> <ESC>:set iminsert=0<CR>

"ツールバー非表示
set guioptions-=T

"メニューバー非表示
set guioptions-=m

"ウィンドウサイズ変更
set lines=80 --mac
set columns=250 --mac

"クリップボードかな
set clipboard=unnamed

"文字コードの設定
autocmd BufNew * set fileencoding=utf8 --win

" ----------------------------------------------------------------------------------------------------
" 
" 諸パスだよ
"
" ----------------------------------------------------------------------------------------------------
"gitvim
let $gitvim = $vim . '/gitvim' --win
let $gitvim = '/Users/ryo/Documents/gitvim' --mac

"share
let $share = 'D:/Dropbox/share'         --win
let $share = '/Users/ryo/Dropbox/share' --mac

"vimrc_non_replace.vim
let $rc = $gitvim . '/rc/vimrc_non_replace.vim'

"vimrc_replaced.vim
let $rc_replaced = $gitvim . '/rc/vimrc_replaced.vim'

"myScripts
let $myScripts  = $gitvim . '/myScripts'

"AutoHotkeys
let $ahk     = "D:/MyDocument/AutoHotKeys" --win
let $ahkini  = "C:/Program Files/AutoHotkey/AutoHotkeyU64.ahk" --win

"account
let $account = "D:/MyDocument/account" --win

let $private = "/Users/ryo/Library/Application Support/KeyRemap4MacBook/private.xml" --mac

"tmp
let $tmp = "D:/MyDocument/tmp"         --win
let $tmp = "/Users/ryo/Documents/tmp/" --mac

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
let $bomber = 'D:/MyDocument/Program/bomberman' --win
let $bomber = '/Users/ryo/Documents/projects/bomberman' --mac

"colors
let $colors = 'D:/MyDocument/Program/colors' --win
let $colors = '/Users/ryo/Documents/projects/colors' --mac

"slf
let $slf = '/Users/ryo/Documents/projects/slf'

let $application  = $slf . '/application'              --mac
let $controllers  = $application . '/controllers'      --mac
let $domain       = $application . '/domain'           --mac
let $models       = $application . '/models'           --mac
let $presentation = $application . '/presentation'     --mac
let $transfer     = $application . '/transfer'         --mac
let $scripts      = $application . '/views/pc/scripts' --mac
let $logs         = $slf . '/data/logs/application'    --mac
let $css          = $slf . '/htdocs/css'               --mac
let $js           = $slf . '/htdocs/js'                --mac
let $testdata     = $slf . '/testdata'                 --mac
let $tests        = $slf . '/tests'                    --mac


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

"タブ（バッファ）を閉じる
nnoremap <C-Space> :call TabCloserController()<CR> --win
nnoremap <D-Space> :call TabCloserController()<CR> --mac

nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W
" ----------------------------------------------------------------------------------------------------
" 
" その他操作のマッピングだよ
"
" ----------------------------------------------------------------------------------------------------
" , -> zz
nnoremap , zz

" * コマンドで移動しない
nnoremap * *N

" cc -> bcw
nnoremap cc bcw

"redo
nmap <S-u> <C-r>

"ハイライトの無効化
nmap <silent><ESC><ESC> :noh<CR>

"全選択
vnoremap , <ESC>ggVG

"単語をコピー
nnoremap yy :call WordYankController()<CR>

"単語を置換ペースト
nnoremap yp ciw<C-r>0<ESC>

"ビジュアル矩形モードの物理キー配置をmac と揃える
nnoremap <M-S-v> <C-S-v> --win

"コマンドラインモードへ移行
nnoremap <sid>(command-line-enter) q: --win
nnoremap <sid>(command-line-enter) q: --mac
nmap <M-:>  <sid>(command-line-enter) --win
nmap '      <sid>(command-line-enter) --mac

"コメント操作
nnoremap <M-/>  :call FlexibleCommentController('add')<CR>    --win
vnoremap <M-/>  :call FlexibleCommentController('add')<CR>    --win
nnoremap ?      :call FlexibleCommentController('delete')<CR> --win
vnoremap ?      :call FlexibleCommentController('delete')<CR> --win
nnoremap <M-?>  :call FlexibleCommentController('switch')<CR> --win
vnoremap <M-?>  :call FlexibleCommentController('switch')<CR> --win

nnoremap <C-F6> :call FlexibleCommentController('add')<CR>    --mac
vnoremap <C-F6> :call FlexibleCommentController('add')<CR>    --mac
nnoremap ?      :call FlexibleCommentController('delete')<CR> --mac
vnoremap ?      :call FlexibleCommentController('delete')<CR> --mac
nnoremap <C-F7> :call FlexibleCommentController('switch')<CR> --mac
vnoremap <C-F7> :call FlexibleCommentController('switch')<CR> --mac

"フランク
nnoremap <S-M-CR> :call FlexibleFrankController('new')<CR> --win
nnoremap <S-C-CR> :call FlexibleFrankController('new')<CR> --mac

"GitAssist
command! G :call GitAssistController('new')

"補完操作のマッピング
inoremap <M-CR>   <C-p>--win
inoremap <S-M-CR> <C-n>--win
inoremap <C-CR>   <C-p>--mac
inoremap <S-C-CR> <C-n>--mac

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
" 諸プラグインの設定だよ
"
" ----------------------------------------------------------------------------------------------------

" ----------------------------------------------------------------------------------------------------
" 
" 自作スクリプトの読み込みだよ
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
" 自動コマンド
"
" ----------------------------------------------------------------------------------------------------
autocmd QuickFixCmdPost *grep* cwindow

" ----------------------------------------------------------------------------------------------------
" 
" 環境変数の追記
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
<<<<<<< HEAD



":J tenshi
command! -nargs=1 -complete=buffer J call Hoge(<f-args>)

function! Hoge(str)
	echo "hi I'm hoge."
	echo "args is " . a:str
endfunction



source $myScripts/FlexibleFrank2/FlexibleFrank2Controller.vim
nnoremap <F9> :call FlexibleFrank2Controller()<CR>
command! -nargs=1 -complete=dir FF call FlexibleFrank2Controller(<f-args>)
=======
command! -nargs=+ D call MySQLAssistController(<f-args>)
>>>>>>> 40a0a34225c8e19bf2ff3c576f0dd6236a09c5ae
