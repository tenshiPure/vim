"CommandDispatcher.vim

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
	except NotExecutedFrankNException as e:
		e.showMessage()
	except NotExecutedBeforeFixCommandException as e:
		e.showMessage()
	except NoMoreBeforeDirException as e:
		e.showMessage()
	else:
		print '[' + command.commandName + '] OK.'

EOM

endfunction
