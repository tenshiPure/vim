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
	frank.reloadFrank()

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

elif mode == 'lcd':
	ChangeDir.cd(frank, 'local')

elif mode == 'cd':
	ChangeDir.cd(frank)

elif mode == 'lcdUpper':
	ChangeDir.cdUpper('local')

elif mode == 'cdUpper':
	ChangeDir.cdUpper()

elif mode == 'lcdLast':
	ChangeDir.cdLast('local')

elif mode == 'cdLast':
	ChangeDir.cdLast()

elif mode == 'tab':
	if frank.single:
		frank.moreFrank()
	else:
		myTab.changeWindow()

elif mode == 'copy':
	Copy.execute(frank)

elif mode == 'move':
	Move.execute(frank)

elif mode == 'delete':
	Delete.execute(frank)

elif mode == 'mkdir':
	Mkdir.execute(frank)

elif mode == 'renameBuf':
	Rename.renameBuf(frank)

elif mode == 'renameFix':
	Rename.renameFix()

EOM

endfunction
