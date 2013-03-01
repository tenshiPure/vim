"FreelyExplorer

"PreExecute.vim
"フルパスの作成や、実行チェック

function! PreExecute(attribute)
	
	"取得：アクティブバッファ名
	let current_buf = expand("%:t")

	"取得：ヘッド部＋ファイル名
	let head_and_filename = GetHeadAndFilename()

	"取得：フルパス
	let full_path = GetFullPath(head_and_filename)

	"判定：作業ファイル
	if current_buf == 'Working_Text.fe'

		"判定：空行
		if head_and_filename == ""
			"判定：装飾キーあり
			if a:attribute == 'attribute'
				let dict = {'exe' : 'freely_explorer', 'full_path' : getcwd(), 'is_dir' : 0}

				return dict
			endif
		endif

	else
		
		"判定：装飾キーなし
		if a:attribute == 'none'
			let dict = {'exe' : 'not execute', 'full_path' : '', 'is_dir' : 0}

		"判定：装飾キーあり
		elseif a:attribute == 'attribute'
			let dict = {'exe' : 'freely_explorer', 'full_path' : getcwd(), 'is_dir' : 0}

		endif

		return dict
	endif

	"判定：空行
	if head_and_filename == ""
		let dict = {'exe' : 'not execute', 'full_path' : '', 'is_dir' : 0}

		return dict
	endif

	"判定： ./
	if head_and_filename == './'
 
		" ./ を消去
		let full_path = substitute(full_path, '\\\./', '', 'g')

		"判定：装飾キーなし
		if a:attribute == 'none'
			let dict = {'exe' : 'move', 'full_path' : full_path, 'is_dir' : 1}

		"判定：装飾キーあり
		elseif a:attribute == 'attribute'
			let dict = {'exe' : 'os_explorer', 'full_path' : full_path, 'is_dir' : 1}

		endif

		return dict
	endif

	"判定： -
	if head_and_filename == '-'

		"判定：装飾キーなし
		if a:attribute == 'none'
			let dict = {'exe' : 'move_back', 'full_path' : '', 'is_dir' : 1}
		endif

		return dict
	endif

	"環境に適した区切り文字に置換をする
	if has('win32')
		let full_path = substitute(full_path, '/', '\', 'g')
	elseif has('mac')
		let full_path = substitute(full_path, '\', '/', 'g')
	endif

	"../ の場合、../ と１階層分を削除（/[^/]+/../
	if has('win32')
		let full_path = substitute(full_path, '\\[^\\]\+\\\.\.\\', '', 'g')
	elseif has('mac')
		let full_path = substitute(full_path, '/[^/]\+/\.\.\/', '', 'g')
	endif

	"ディレクトリか否かのフラグ　（ 0 : file  1 : dir
	let is_dir = isdirectory(full_path)

	"装飾キー：なし　ファイル
	if a:attribute == 'none' && is_dir == 0
		let dict = {'exe' : 'edit', 'full_path' : full_path, 'is_dir' : 0}

	"装飾キー：なし　ディレクトリ
	elseif a:attribute == 'none' && is_dir == 1
		let dict = {'exe' : 'move', 'full_path' : full_path, 'is_dir' : 1}

	"装飾キー：あり　ファイル
	elseif a:attribute == 'attribute' && is_dir == 0
		let dict = {'exe' : 'tabedit', 'full_path' : full_path, 'is_dir' : 0}

	"装飾キー：あり　ディレクトリ
	elseif a:attribute == 'attribute' && is_dir == 1
		let dict = {'exe' : 'os_explorer', 'full_path' : full_path, 'is_dir' : 1}

	endif

	return dict
endfunction
