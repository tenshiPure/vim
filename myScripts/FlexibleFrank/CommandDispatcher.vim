"CommandDispatcher.vim

source $myScripts/TabCloser/TabCloserController.vim
source $myScripts/MyLib/MyTab.vim

source $myScripts/FlexibleFrank/command/CommandBase.vim
source $myScripts/FlexibleFrank/command/Edit.vim
source $myScripts/FlexibleFrank/command/ChangeDir.vim
source $myScripts/FlexibleFrank/command/ChangeDirUpper.vim
source $myScripts/FlexibleFrank/command/ChangeDirLast.vim
source $myScripts/FlexibleFrank/command/OpenByApp.vim
source $myScripts/FlexibleFrank/command/OpenDir.vim
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
	command = TabCloser()
	command.execute()

elif mode == 'reload':
	frank1.reloadFrank()
	frank2.reloadFrank()
	MyTab.changeWindow()

elif mode == 'pointOn':
	frank.pointOn(int(firstLine), int(lastLine))

elif mode == 'pointOff':
	frank.pointOff(int(firstLine), int(lastLine))

elif mode == 'edit':
	command = Edit()
	command.execute(frank)

elif mode == 'openDir':
	command = OpenDir()
	command.execute(frank)

elif mode == 'openByApp':
	command = OpenByApp()
	command.openByApp(frank)

elif mode == 'cd':
	command = ChangeDir()
	command.execute(frank)

elif mode == 'cdUpper':
	command = ChangeDirUpper()
	command.execute(frank)

elif mode == 'cdLast':
	command = ChangeDirLast()
	command.execute(frank)

elif mode == 'tab':
	MyTab.changeWindow()

elif mode == 'copy':
	command = Copy()
	command.execute(frank)
	frank1.reloadFrank()
	frank2.reloadFrank()

elif mode == 'move':
	command = Move()
	command.execute(frank)
	frank1.reloadFrank()
	frank2.reloadFrank()
	MyTab.changeWindow()

elif mode == 'delete':
	command = Delete()
	command.execute(frank)
	frank1.reloadFrank()
	frank2.reloadFrank()
	MyTab.changeWindow()

elif mode == 'mkdir':
	command = Mkdir()
	command.execute(frank)
	frank1.reloadFrank()
	frank2.reloadFrank()
	MyTab.changeWindow()

elif mode == 'renameBuf':
	command.renameBuf(frank)

elif mode == 'renameFix':
	command.renameFix()
	frank1.reloadFrank()
	frank2.reloadFrank()
	MyTab.changeWindow()

EOM

endfunction
