"CommandDispatcher.vim

source $myScripts/TabCloser/TabCloserController.vim
source $myScripts/MyLib/MyTab.vim

source $myScripts/FlexibleFrank/command/CommandBase.vim
source $myScripts/FlexibleFrank/command/Prev.vim
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

source $myScripts/FlexibleFrank/CommandFactory.vim

source $myScripts/FlexibleFrank/exception/TargetNotFileOnlyException.vim
source $myScripts/FlexibleFrank/exception/TargetNotDirException.vim
source $myScripts/FlexibleFrank/exception/TargetNotFileException.vim
source $myScripts/FlexibleFrank/exception/DestinationNotDirException.vim
source $myScripts/FlexibleFrank/exception/NotPoiontedException.vim
source $myScripts/FlexibleFrank/exception/NotMatchEntryNumbersException.vim

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

elif mode == 'tab':
	MyTab.changeWindow()

elif mode == 'renameBuf':
	command.renameBuf(frank)

elif mode == 'renameFix':
	try:
		command.fix()
	except DestinationNotDirException as e:
		e.showMessage()
	except NotMatchEntryNumbersException as e:
		e.showMessage()

else:
	factory = CommandFactory()
	command = factory.create(mode)

	try:
		command.execute(frank)
	except TargetNotFileOnlyException as e:
		e.showMessage()
	except TargetNotDirException as e:
		e.showMessage()
	except TargetNotFileException as e:
		e.showMessage()
	except DestinationNotDirException as e:
		e.showMessage()
	except NotPoiontedException as e:
		e.showMessage()

EOM

endfunction
