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
source $myScripts/FlexibleFrank/command/PointOn.vim
source $myScripts/FlexibleFrank/command/PointOff.vim
source $myScripts/FlexibleFrank/command/Close.vim

source $myScripts/FlexibleFrank/CommandFactory.vim

source $myScripts/FlexibleFrank/exception/TargetNotFileOnlyException.vim
source $myScripts/FlexibleFrank/exception/TargetNotDirException.vim
source $myScripts/FlexibleFrank/exception/TargetNotFileException.vim
source $myScripts/FlexibleFrank/exception/DestinationNotDirException.vim
source $myScripts/FlexibleFrank/exception/NotPoiontedException.vim
source $myScripts/FlexibleFrank/exception/NotMatchEntryNumbersException.vim
source $myScripts/FlexibleFrank/exception/NotMatchEntryNumbersException.vim
source $myScripts/FlexibleFrank/exception/NotMatchEntryNumbersException.vim

function! CommandDispatcher(mode) range

python <<EOM

import vim

mode = vim.eval('a:mode')
firstLine = int(vim.eval('a:firstline'))
lastLine = int(vim.eval('a:lastline'))

if mode == 'Close':
	command = TabCloser()
	command.execute()

elif mode == 'Reload':
	frank.reloadFrank()

elif mode == 'Fix':
	try:
		command.fix()
	except DestinationNotDirException as e:
		e.showMessage()
	except NotMatchEntryNumbersException as e:
		e.showMessage()

else:
	factory = CommandFactory()
	command = factory.create(mode, firstLine, lastLine)

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
