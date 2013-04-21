"FlexibleFrank.vim

source $myScripts/myLib/myTab.vim

source $myScripts/FlexibleFrank/Entry.vim
source $myScripts/FlexibleFrank/FlexibleFrank.vim

autocmd FocusLost *.frank :call FlexibleFrankController('close')
autocmd TabLeave *.frank :call FlexibleFrankController('close')

autocmd BufRead,BufNewFile *.frank set filetype=frank

function! FlexibleFrankController(mode)
python <<EOM
FlexibleFrankController().execute(vim.eval('a:mode'))
EOM
endfunction





python <<EOM
import vim
import os
import glob

class FlexibleFrankController:

	#
	# 擬似コンストラクタ
	#
	def __init__(self):
		pass

	#
	# コントローラから呼ばれる、処理振り分けメソッド
	#
	def execute(self, mode):

		if mode == 'new':
			FlexibleFrank().newFrank()
		elif mode == 'close':
			myTab.closeWorkingText()

EOM