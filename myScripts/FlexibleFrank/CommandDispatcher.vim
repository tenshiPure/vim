"CommandDispatcher.vim

source $myScripts/TabCloser/TabCloserController.vim
source $myScripts/myLib/myTab.vim

source $myScripts/FlexibleFrank/command/Helper.vim
source $myScripts/FlexibleFrank/command/Edit.vim
source $myScripts/FlexibleFrank/command/ChangeDir.vim
source $myScripts/FlexibleFrank/command/Explorer.vim
source $myScripts/FlexibleFrank/command/Copy.vim
source $myScripts/FlexibleFrank/command/Move.vim
source $myScripts/FlexibleFrank/command/Delete.vim
source $myScripts/FlexibleFrank/command/Mkdir.vim
source $myScripts/FlexibleFrank/command/Rename.vim

function! CommandDispatcher(mode) range

python <<EOM

import vim

mode = vim.eval('a:mode')
firstLine = vim.eval('a:firstline')
lastLine = vim.eval('a:lastline')

frank = None
if vim.current.buffer.name == pathFrank1:
	frank = frank1
if vim.current.buffer.name == pathFrank2:
	frank = frank2

if mode == 'close':
	tabCloser = TabCloser()
	tabCloser.execute()

elif mode == 'reload':
	frank1.reloadFrank()
	frank2.reloadFrank()

elif mode == 'pointOn':
	frank.pointOn(int(firstLine), int(lastLine))

elif mode == 'pointOff':
	frank.pointOff(int(firstLine), int(lastLine))

elif mode == 'edit':
	Edit.execute(frank)

elif mode == 'openDir':
	Explorer.openDir(frank)

elif mode == 'openByApp':
	Explorer.openByApp(frank)

elif mode == 'cd':
	ChangeDir.cd(frank)

elif mode == 'cdUpper':
	ChangeDir.cdUpper(frank)

elif mode == 'cdLast':
	ChangeDir.cdLast(frank)

elif mode == 'tab':
	myTab.changeWindow()

elif mode == 'copy':
	Copy.execute(frank)
	frank.reloadFrank()

elif mode == 'move':
	Move.execute(frank)
	frank1.reloadFrank()
	frank2.reloadFrank()

elif mode == 'delete':
	Delete.execute(frank)
	frank1.reloadFrank()
	frank2.reloadFrank()

elif mode == 'mkdir':
	Mkdir.execute(frank)
	frank1.reloadFrank()
	frank2.reloadFrank()

elif mode == 'renameBuf':
	Rename.renameBuf(frank)

elif mode == 'renameFix':
	Rename.renameFix()
	frank1.reloadFrank()
	frank2.reloadFrank()

EOM

endfunction
