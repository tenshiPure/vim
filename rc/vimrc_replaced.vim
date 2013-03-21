
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
if os == 'mac'
	set lines=80 
endif
if os == 'mac'
	set columns=250 
endif

"クリップボードかな
set clipboard=unnamed

"長い行でも自動改行しない
set textwidth=0

"文字コードの設定
if os == 'win'
	autocmd BufNew * set fileencoding=utf8 
endif

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

"タブ（バッファ）を閉じる
if os == 'win'
	nnoremap <C-Space> :call TabCloser(expand("%:p"), '')<CR> 
endif
if os == 'mac'
	nnoremap <D-Space> :call TabCloser(expand("%:p"), '')<CR> 
endif

" ----------------------------------------------------------------------------------------------------
" 
" その他操作のマッピングだよ
"
" ----------------------------------------------------------------------------------------------------
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
nnoremap yy :call WordYank()<CR>

"単語を置換ペースト
nnoremap yp ciw<C-r>0<ESC>

"ビジュアル矩形モードの物理キー配置をmac と揃える
if os == 'win'
	nnoremap <M-S-v> <C-S-v> 
endif

"レジスタへ格納（フルパス）
if os == 'win'
	command! RegP :let @*=expand('%:p') 
endif
"レジスタへ格納（ファイル名＋拡張子）
if os == 'win'
	command! RegT :let @*=expand('%:t') 
endif

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

"コメント操作
if os == 'win'
	nnoremap <M-/> :call FlexibleComment("Add")<CR>    
endif
if os == 'win'
	vnoremap <M-/> :call FlexibleComment("Add")<CR>    
endif
if os == 'win'
	nnoremap ?     :call FlexibleComment("Delete")<CR> 
endif
if os == 'win'
	vnoremap ?     :call FlexibleComment("Delete")<CR> 
endif
if os == 'win'
	nnoremap <M-?> :call FlexibleComment("Switch")<CR> 
endif
if os == 'win'
	vnoremap <M-?> :call FlexibleComment("Switch")<CR> 
endif

if os == 'mac'
	nnoremap <C-F6> :call FlexibleComment("Add")<CR>    
endif
if os == 'mac'
	vnoremap <C-F6> :call FlexibleComment("Add")<CR>    
endif
if os == 'mac'
	nnoremap ?      :call FlexibleComment("Delete")<CR> 
endif
if os == 'mac'
	vnoremap ?      :call FlexibleComment("Delete")<CR> 
endif
if os == 'mac'
	nnoremap <C-F7> :call FlexibleComment("Switch")<CR> 
endif
if os == 'mac'
	vnoremap <C-F7> :call FlexibleComment("Switch")<CR> 
endif

"make コマンドの実行と結果の出力
command! Mk :call MakeExecuter(&filetype, 'Make')
command! Rn :call MakeExecuter(&filetype, 'Run')
command! Ts :call MakeExecuter(&filetype, 'Test')
if os == 'win'
	nnoremap <M-UP> :call MakeExecuter(&filetype, 'Re!')<CR> 
endif
if os == 'mac'
	nnoremap <C-UP> :call MakeExecuter(&filetype, 'Re!')<CR> 
endif

"作業ファイルか、装飾キーがあるか、取得したパスはディレクトリか、で実行コマンド振り分ける。
"FreelyExplorer
"edit
"tabedit
"move
"move_back
"os_explorer
"none
if os == 'win'
	nnoremap <M-CR> :call ExecuteDispatcher('none')<CR> 
endif
if os == 'mac'
	nnoremap <C-CR> :call ExecuteDispatcher('none')<CR> 
endif
if os == 'win'
	nnoremap <S-M-CR> :call ExecuteDispatcher('attribute')<CR> 
endif
if os == 'mac'
	nnoremap <S-C-CR> :call ExecuteDispatcher('attribute')<CR> 
endif
command! Fetop /^[^\t./-]\+$
command! Feall /^[^./-]\+$

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
" ファンクションキーのマッピングだよ
"
" ----------------------------------------------------------------------------------------------------
"ヘルプの誤作動防止
nnoremap <F1> <ESC>
inoremap <F1> <ESC>

"vimrc の置換と読み込み
nnoremap <F7> :call ReloadVimrc()<CR>:source $rc_replaced<CR>

"明細のログ出力文
if os == 'mac'
	"inoremap <F2> $this->debugLog(__LINE__, 'output_all ... ' . print_r($, true));<ESC>9<LEFT>a
endif

"SeLFのログ出力文
if os == 'mac'
	inoremap <F2> AppLog::debug('output ... ' . print_r($, true));<ESC>9<LEFT>a
endif
		
"全消去して保存
if os == 'mac'
	nnoremap <F5> ggdG:w<ENTER> 
endif

"ぼっちのログ出力文
nnoremap <F10> iecho '<pre>';<ENTER>var_dump($);<ENTER>echo '</pre>';<ESC><UP><LEFT>i
inoremap <F10>  echo '<pre>';<ENTER>var_dump($);<ENTER>echo '</pre>';<ESC><UP><LEFT>i

"ログ出力の検索
if os == 'mac'
	nnoremap <S-F5> /output<ENTER> 
endif

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
if os == 'win'
	source $myScripts/FlexibleFolding/FlexibleFolding.vim 
endif

"CodeFormater
if os == 'win'
	source $myScripts/CodeFormater/CodeFormater.vim 
endif

"SetFileType
source $myScripts/common/SetFileType.vim

"TagController
source $myScripts/TagController/TagController.vim
set tags=/Users/ryo/Documents/projects/slf/tags
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