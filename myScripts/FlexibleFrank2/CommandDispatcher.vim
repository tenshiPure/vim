"CommandDispatcher.vim

source $myScripts/TabCloser/TabCloserController.vim
source $myScripts/myLib/myTab.vim

source $myScripts/FlexibleFrank2/command/Helper.vim
source $myScripts/FlexibleFrank2/command/Edit.vim
source $myScripts/FlexibleFrank2/command/ChangeDir.vim
source $myScripts/FlexibleFrank2/command/Explorer.vim
source $myScripts/FlexibleFrank2/command/Copy.vim
source $myScripts/FlexibleFrank2/command/Move.vim
source $myScripts/FlexibleFrank2/command/Delete.vim
source $myScripts/FlexibleFrank2/command/Mkdir.vim
source $myScripts/FlexibleFrank2/command/Rename.vim

function! CommandDispatcher(mode) range

python <<EOM

import vim

mode = vim.eval('a:mode')
firstLine = vim.eval('a:firstline')
lastLine = vim.eval('a:lastline')

if mode == 'close':
	tabCloser = TabCloser()
	tabCloser.execute()

elif mode == 'reload':
	frank1.reloadFrank()

elif mode == 'pointOn':
	frank1.pointOn(int(firstLine), int(lastLine))

elif mode == 'pointOff':
	frank1.pointOff(int(firstLine), int(lastLine))

elif mode == 'edit':
	Edit.execute(frank1)

elif mode == 'openDir':
	Explorer.openDir(frank1)

elif mode == 'openByApp':
	Explorer.openByApp(frank1)

elif mode == 'cd':
	ChangeDir.cd(frank1)

elif mode == 'cdUpper':
	ChangeDir.cdUpper(frank1)

elif mode == 'cdLast':
	ChangeDir.cdLast(frank1)

elif mode == 'tab':
	myTab.changeWindow()

elif mode == 'copy':
	Copy.execute(frank1)
	frank1.reloadFrank()

elif mode == 'move':
	Move.execute(frank1)
	frank1.reloadFrank()

elif mode == 'delete':
	Delete.execute(frank1)
	frank1.reloadFrank()

elif mode == 'mkdir':
	Mkdir.execute(frank1)
	frank1.reloadFrank()

elif mode == 'renameBuf':
	Rename.renameBuf(frank1)

elif mode == 'renameFix':
	Rename.renameFix()

EOM

endfunction
