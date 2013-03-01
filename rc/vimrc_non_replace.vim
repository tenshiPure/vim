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

"長い行でも自動改行しない
set textwidth=0

"文字コードの設定
"set fileencoding=utf-8 --win

autocmd BufNew * set fileencoding=utf8--win

"この辺はスクリプト内かしら
"view ファイルの作成場所
"set viewdir=D:\Dropbox\share\vim\view--win
"set viewdir=/Users/ryo/Dropbox/share/vim/view--mac

"view に保存するオプションの変更（folds,options,cursor）
"set viewoptions=folds

"折り畳んだときに表示する１行を作成する関数
"set foldtext=MyFoldText()

"行数の左に、折り畳みの階層を表示
"set foldcolumn=5
"set foldcolumn=0

"最終文字からエディタの物理端までを埋める文字を消去
"set fillchars=vert:\|

"折り畳みを示す色
"hi Folded gui=bold term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey30 guifg=Grey80
"折り畳みガイドバー色
"hi FoldColumn gui=bold term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue

" ----------------------------------------------------------------------------------------------------
" 
" 諸パスだよ
"
" ----------------------------------------------------------------------------------------------------
"gitvim
let $gitvim = $vim . '/gitvim' --win

"share
let $share = 'D:/Dropbox/share'         --win
let $share = '/Users/ryo/Dropbox/share' --mac

"vimrc_non_replace.vim
let $rc = $gitvim . '/rc/vimrc_non_replace.vim'

"vimrc_replaced.vim
let $rc_replaced = $gitvim . '/rc/vimrc_replaced.vim'

"myScripts
"let $myScripts  = $share . '/vim/myScripts'
let $myScripts  = $gitvim . '/myScripts'

"AutoHotkeys
let $ahk     = "D:/MyDocument/AutoHotKeys" --win
let $ahkini  = "C:/Program Files/AutoHotkey/AutoHotkeyU64.ahk" --win

"account
let $account = "D:/MyDocument/account" --win

"KeyRemap4MacBook の設定ファイルのパス
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

"botch
let $dir88 = $share . '/../projects/dir88'

"bomber
let $bomber = 'D:/MyDocument/Program/bomberman' --win
let $bomber = '/Users/ryo/Documents/projects/bomberman' --mac

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

"mac だと 4 とかになっちゃう
"Ctrl 追加でウィンドウ移動
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

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
nnoremap <C-Space> :call TabCloser(expand("%:p"), '')<CR> --win
nnoremap <D-Space> :call TabCloser(expand("%:p"), '')<CR> --mac

" ----------------------------------------------------------------------------------------------------
" 
" その他操作のマッピングだよ
"
" ----------------------------------------------------------------------------------------------------
" * コマンドで移動しない
nnoremap * *N

"redo
nmap <S-u> <C-r>

"ハイライトの無効化
nmap <silent><ESC><ESC> :noh<CR>

"全選択
vnoremap , <ESC>ggVG

"単語をコピー
nnoremap yy :call WordYank()<CR>

"単語を置換ペースト
nnoremap yp ciw<C-r>0<ESC>

"ビジュアル矩形モードの物理キー配置をmac と揃える
nnoremap <M-S-v> <C-S-v> --win

"レジスタへ格納（フルパス）
command! RegP :let @*=expand('%:p') --win
"レジスタへ格納（ファイル名＋拡張子）
command! RegT :let @*=expand('%:t') --win

"コマンドラインモードへ移行
nnoremap <sid>(command-line-enter) q: --win
nnoremap <sid>(command-line-enter) q: --mac
nmap <M-:>  <sid>(command-line-enter) --win
nmap '      <sid>(command-line-enter) --mac

"コメント操作
nnoremap <M-/> :call FlexibleComment("Add")<CR>    --win
vnoremap <M-/> :call FlexibleComment("Add")<CR>    --win
nnoremap ?     :call FlexibleComment("Delete")<CR> --win
vnoremap ?     :call FlexibleComment("Delete")<CR> --win
nnoremap <M-?> :call FlexibleComment("Switch")<CR> --win
vnoremap <M-?> :call FlexibleComment("Switch")<CR> --win

nnoremap <C-F6> :call FlexibleComment("Add")<CR>    --mac
vnoremap <C-F6> :call FlexibleComment("Add")<CR>    --mac
nnoremap ?      :call FlexibleComment("Delete")<CR> --mac
vnoremap ?      :call FlexibleComment("Delete")<CR> --mac
nnoremap <C-F7> :call FlexibleComment("Switch")<CR> --mac
vnoremap <C-F7> :call FlexibleComment("Switch")<CR> --mac

"make コマンドの実行と結果の出力
command! Mk :call MakeExecuter(&filetype, 'Make')
command! Rn :call MakeExecuter(&filetype, 'Run')
command! Ts :call MakeExecuter(&filetype, 'Test')
nnoremap <M-UP> :call MakeExecuter(&filetype, 'Re!')<CR> --win
nnoremap <C-UP> :call MakeExecuter(&filetype, 'Re!')<CR> --mac

"作業ファイルか、装飾キーがあるか、取得したパスはディレクトリか、で実行コマンド振り分ける。
"FreelyExplorer
"edit
"tabedit
"move
"move_back
"os_explorer
"none
nnoremap <M-CR> :call ExecuteDispatcher('none')<CR> --win
nnoremap <C-CR> :call ExecuteDispatcher('none')<CR> --mac
nnoremap <S-M-CR> :call ExecuteDispatcher('attribute')<CR> --win
nnoremap <S-C-CR> :call ExecuteDispatcher('attribute')<CR> --mac
command! Fetop /^[^\t./-]\+$
command! Feall /^[^./-]\+$

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

"明細のログ出力文
"inoremap <F2> $this->debugLog(__LINE__, 'output_all ... ' . print_r($, true));<ESC>9<LEFT>a--mac

"SeLFのログ出力文
inoremap <F2> AppLog::debug('output ... ' . print_r($, true));<ESC>9<LEFT>a--mac
		
"全消去して保存
nnoremap <F5> ggdG:w<ENTER> --mac

"ぼっちのログ出力文
nnoremap <F10> iecho '<pre>';<ENTER>var_dump($);<ENTER>echo '</pre>';<ESC><UP><LEFT>i
inoremap <F10>  echo '<pre>';<ENTER>var_dump($);<ENTER>echo '</pre>';<ESC><UP><LEFT>i

"ログ出力の検索
nnoremap <S-F5> /output<ENTER> --mac

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
source $myScripts/FlexibleComment/FlexibleComment.vim

"FreelyExplorer
source $myScripts/FreelyExplorer/FreelyExplorer.vim

"WordYank
source $myScripts/common/WordYank.vim

"ReloadVimrc
source $myScripts/ReloadVimrc/ReloadVimrc.vim

"TabCloser
source $myScripts/common/TabCloser.vim

"MakeExecuter
source $myScripts/MakeExecuter/MakeExecuter.vim

"FlexibleFolding
source $myScripts/FlexibleFolding/FlexibleFolding.vim --win

"CodeFormater
source $myScripts/CodeFormater/CodeFormater.vim --win

"SetFileType
source $myScripts/common/SetFileType.vim





"source $myScripts/MoveRepeater/MoveRepeater.vim
"nnoremap <F9> :call MoveRepeater("")<LEFT><LEFT>




set tags=/Users/ryo/Documents/projects/slf/tags
"nnoremap <F6> :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>
nnoremap <F6> :<C-u>tab stj <C-R>=expand('<cword>')
"nnoremap <F6> :stag <C-R>=expand('<cword>')

source $myScripts/TagController/TagController.vim
command! Tv :execute ':normal *' | call TagController('v')
command! Ts :execute ':normal *' | call TagController('s')
command! Tt :execute ':normal *' | call TagController('t')


cnoremap <S-BS> <ESC>:call DeleteDirectoryParser()<CR>

function! DeleteDirectoryParser()

	echo 'hoge'
	return

	let current_line = getline(".")
	let delete_string = matchstr(current_line, '[^/]\+$')
	let new_line = substitute(current_line, delete_string, '', 'g')
	call setline(".", new_line)

endfunction


command! Tmptest :!phpunit --stderr -c /Users/ryo/Documents/projects/slf/tests/phpunit.xml --group=slf /Users/ryo/Documents/projects/slf/tests/application/
