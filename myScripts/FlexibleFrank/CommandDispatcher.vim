"CommandDispatcher.vim

source $myScripts/TabCloser/TabCloserController.vim
source $myScripts/MyLib/MyTab.vim

source $myScripts/FlexibleFrank/Command/CommandBase.vim
source $myScripts/FlexibleFrank/Command/Prev.vim
source $myScripts/FlexibleFrank/Command/Edit.vim
source $myScripts/FlexibleFrank/Command/ChangeDir.vim
source $myScripts/FlexibleFrank/Command/ChangeDirUpper.vim
source $myScripts/FlexibleFrank/Command/ChangeDirLast.vim
source $myScripts/FlexibleFrank/Command/OpenByApp.vim
source $myScripts/FlexibleFrank/Command/OpenDir.vim
source $myScripts/FlexibleFrank/Command/Copy.vim
source $myScripts/FlexibleFrank/Command/Move.vim
source $myScripts/FlexibleFrank/Command/Delete.vim
source $myScripts/FlexibleFrank/Command/Mkdir.vim
source $myScripts/FlexibleFrank/Command/Rename.vim
source $myScripts/FlexibleFrank/Command/PointOn.vim
source $myScripts/FlexibleFrank/Command/PointOff.vim
source $myScripts/FlexibleFrank/Command/Fix.vim


source $myScripts/FlexibleFrank/Exception/TargetNotFileOnlyException.vim
source $myScripts/FlexibleFrank/Exception/TargetNotDirException.vim
source $myScripts/FlexibleFrank/Exception/TargetNotFileException.vim
source $myScripts/FlexibleFrank/Exception/DestinationNotDirException.vim
source $myScripts/FlexibleFrank/Exception/NotPoiontedException.vim
source $myScripts/FlexibleFrank/Exception/NotMatchEntryNumbersException.vim
source $myScripts/FlexibleFrank/Exception/NotExecutedFrank1Exception.vim
source $myScripts/FlexibleFrank/Exception/NotExecutedBeforeFixCommandException.vim

function! CommandDispatcher(mode) range

python <<EOM

import vim

mode = vim.eval('a:mode')
firstLine = int(vim.eval('a:firstline'))
lastLine = int(vim.eval('a:lastline'))

if mode == 'Close':
	command = TabCloser()
	command.execute()

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
	except NotMatchEntryNumbersException as e:
		e.showMessage()
	except NotExecutedFrank1Exception as e:
		e.showMessage()
	except NotExecutedBeforeFixCommandException as e:
		e.showMessage()

EOM

endfunction
