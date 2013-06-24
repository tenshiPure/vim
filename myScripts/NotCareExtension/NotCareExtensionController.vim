"NotCareExtension

source $myScripts/MyLib/MyFile.vim

source $myScripts/NotCareExtension/ExtensionObjects/Vim.vim

function! NotCareExtensionController(behavior, ...) range

python <<EOM
import vim

if vim.eval('a:0') == '0':
	fileName = vim.current.buffer.name
else:
	fileName = vim.eval('a:1')

extension = MyFile.getExtension()
behavior = vim.eval('a:behavior')
firstLine = int(vim.eval('a:firstline')) - 1
lastLine = int(vim.eval('a:lastline')) - 1


if extension == 'vim':
	extensionObject = Vim(behavior, firstLine, lastLine, fileName)

extensionObject.execute()

EOM

endfunction
