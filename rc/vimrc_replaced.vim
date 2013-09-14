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

"文字コード設定 @win
autocmd BufWinEnter * set fileencoding=utf8

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
"gitvim @win
let $gitvim = $vim . '/gitvim'


"vim
let $ignore      = $gitvim    . '/.gitignore'
let $rc          = $gitvim    . '/rc/vimrc_non_replace.vim'
let $rc_replaced = $gitvim    . '/rc/vimrc_replaced.vim'
let $MyScripts   = $gitvim    . '/MyScripts'
let $lib         = $gitvim    . '/MyLib'
let $fundamental = $gitvim    . '/MyFundamental'
let $frank       = $MyScripts . '/FlexibleFrank'
let $cass        = $MyScripts . '/CommandAssistant'
let $notcare     = $MyScripts . '/NotCareExtension'
let $trans       = $MyScripts . '/Translator'
let $vmail       = $MyScripts . '/vMail'

"AutoHotkeys @win
let $ahk     = "D:/MyDocument/AutoHotKeys"
let $ahkini  = "C:/Program Files/AutoHotkey/AutoHotkeyU64.ahk"

"account @win
let $account = "D:/MyDocument/account"


"tmp @win
let $tmp = "D:/MyDocument/tmp"


"todo @win
let $todo = 'D:/Dropbox/share/todo.txt'




"HiredGirl @win
let $hired = "D:/MyDocument/Program/HiredGirl"

"Pycel @win
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

"----------------------------------------------------------------------------------------------------
"
"挿入モード時のマッピングだよ
"
"----------------------------------------------------------------------------------------------------
"Emacsコマンドで移動
inoremap <C-p> <UP>
inoremap <C-n> <DOWN>
inoremap <C-b> <LEFT>
inoremap <C-f> <RIGHT>
inoremap <C-a> <HOME>
inoremap <C-e> <END>

"Emacsコマンドで削除
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-w> <C-w>
inoremap <C-k> <C-o><S-d>
inoremap <C-u> <C-u>

"インサートモードから戻るときに、日本語入力をオフにする
inoremap <ESC> <ESC>:set iminsert=0<CR>

"補完
inoremap <M-CR>   <C-p>
inoremap <S-M-CR> <C-n>

"----------------------------------------------------------------------------------------------------
"
"選択モードのマッピングだよ
"
"----------------------------------------------------------------------------------------------------
"全選択
vnoremap , <ESC>ggVG

"ビジュアル矩形のキーマップ @win
nnoremap <S-M-v> <S-C-v>


"ビジュアル矩形のキーマップ
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
nnoremap <M-Space> :tabedit 

"バッファを閉じる
nnoremap <C-Space> :call TabClose()<CR>

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
"コマンドラインモード
nnoremap <sid>(command-line-enter) q:

"コマンドラインモードへ移行する @win
nmap <M-:> <sid>(command-line-enter)


"直前のコマンド履歴を表示
nnoremap <C-p> :<UP>

"<C-p/n>でも履歴のフィルタリングを可能に
cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>

"%%で編集バッファの格納パスを展開する
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

"##で文字列「normal 」を展開する
cnoremap ## normal 


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

""--------------------------------------------------
""CommandAssistant
""--------------------------------------------------
"source $MyScripts/CommandAssistant/CommandAssistantController.vim

"command! -nargs=? CA  call CommandAssistantController(<f-args>)
"command! -nargs=0 CAH call CommandAssistantController('history')

"--------------------------------------------------
"FlexibleFrank
"--------------------------------------------------
source $MyScripts/FlexibleFrank/FlexibleFrankController.vim

nnoremap <S-M-CR> :FF ./<CR>

command! -nargs=1 -complete=dir FF call FlexibleFrankController(<f-args>)

"--------------------------------------------------
"NotCareExtension
"--------------------------------------------------
source $MyScripts/NotCareExtension/NotCareExtensionController.vim

"@win
nnoremap <M-/>  :call NotCareExtensionController('commentAdd')<CR>
vnoremap <M-/>  :call NotCareExtensionController('commentAdd')<CR>


nnoremap ?      :call NotCareExtensionController('commentDelete')<CR>
vnoremap ?      :call NotCareExtensionController('commentDelete')<CR>
nnoremap <M-?>  :call NotCareExtensionController('commentSwitch')<CR>
vnoremap <M-?>  :call NotCareExtensionController('commentSwitch')<CR>

command! -nargs=? -complete=file W wall | call NotCareExtensionController('make', <f-args>)
command! -nargs=? T   call NotCareExtensionController('test', <f-args>)
command! -nargs=? Log call NotCareExtensionController('log', <f-args>)

""--------------------------------------------------
""ReloadVimrc
""--------------------------------------------------
"source $MyScripts/ReloadVimrc/ReloadVimrc.vim

"nnoremap <F7> :call ReloadVimrc()<CR>:source $rc_replaced<CR>

"--------------------------------------------------
"WordYank
"--------------------------------------------------
source $MyScripts/WordYank/WordYankController.vim

nnoremap yy :call WordYankController('yank')<CR>
nnoremap yp :call WordYankController('paste')<CR>

"--------------------------------------------------
"Translator
"--------------------------------------------------
source $MyScripts/Translator/TranslatorController.vim

command! -nargs=1 Jts call TranslatorController('arg_ja', <f-args>)
command! -nargs=1 Ets call TranslatorController('arg_en', <f-args>)
command!          Bts call TranslatorController('buffer')
command!          Qts call TranslatorController('quick')
command! -range   Vts call TranslatorController('visual')

""--------------------------------------------------
""VMail
""--------------------------------------------------
"source $MyScripts/VMail/VMailController.vim

"command! Vmail call VMailController('new')

""--------------------------------------------------
""Surround
""--------------------------------------------------
"source $MyScripts/Surround/SurroundController.vim

"command! -nargs=+         Surround call SurroundController('last', <f-args>)
"command! -nargs=+        Qsurround call SurroundController('quick', <f-args>)
"command! -nargs=+ -range Vsurround call SurroundController('visual', <f-args>)

"----------------------------------------------------------------------------------------------------
"
"ワンアクションコマンドだよ
"
"----------------------------------------------------------------------------------------------------
":messagesの省略
command! M messages

"任意の文字列の出現回数を数える
command! -nargs=+ Count call <SID>Count(<f-args>)

"pythonの文字コードコメントを挿入
command! Pyhead :normal i#-*- coding: utf-8 -*-

"ディレクトリパスを開く
source $MyScripts/OpenDirectory/OpenDirectoryController.vim
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

"インクリメント @win
nnoremap <M-a> <C-a>


"デクリメント @win
nnoremap <M-x> <C-x>


"ブラックホールレジスタで削除する @win
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




source $MyScripts/AdapterBase.vim

source $MyScripts/WordCount/WordCountAdapter.vim
nnoremap <F6> :call WordCountAdapter(['let', 'map'])<CR>
command! -nargs=+ Count let args = ConvertArgs(<f-args>) | call WordCountAdapter(args) | unlet args

source $MyScripts/RcParser/RcParserAdapter.vim
nnoremap <F7> :call RcParserAdapter()<CR>:source $rc_replaced<CR>
