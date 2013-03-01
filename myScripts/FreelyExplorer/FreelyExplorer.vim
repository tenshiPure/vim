"FreelyExplorer

"FreelyExplorer.vim
"関連ファイルの読み込みとキーマッピングの設定

"関連ファイルの読み込み
source $myScripts/common/TabFocus.vim

source $myScripts/FreelyExplorer/Printer/EchoEntries.vim
source $myScripts/FreelyExplorer/Printer/PickOutEntries.vim
source $myScripts/FreelyExplorer/Printer/GetAllDirectries.vim
source $myScripts/FreelyExplorer/Printer/MakeFileDict.vim

source $myScripts/FreelyExplorer/Analyzer/GetFilename.vim
source $myScripts/FreelyExplorer/Analyzer/GetHeadpath.vim
source $myScripts/FreelyExplorer/Analyzer/GetHeadAndFilename.vim
source $myScripts/FreelyExplorer/Analyzer/GetFullPath.vim
source $myScripts/FreelyExplorer/Analyzer/GetTabCount.vim
source $myScripts/FreelyExplorer/Analyzer/ListToString.vim

source $myScripts/FreelyExplorer/Executer/ExecuteDispatcher.vim
source $myScripts/FreelyExplorer/Executer/PreExecute.vim
source $myScripts/FreelyExplorer/Executer/FileOpen.vim
source $myScripts/FreelyExplorer/Executer/OsExplorer.vim
source $myScripts/FreelyExplorer/Executer/DirectoryMove.vim

".fe を開いたときに、ファイルタイプを設定する
autocmd BufRead,BufNewFile *.fe set filetype=fe

function! FreelyExplorer(head)

	"作業テキストを編集タブにする
	call TabFocus(expand("$myScripts/FreelyExplorer/Printer/Working_Text.fe"))

	"全エントリを取得
	let l:entries = PickOutEntries(a:head)

	"結果出力
	call EchoEntries(l:entries, a:head)

endfunction
