"NotCareExtension

source $myScripts/MyLib/MyString.vim
source $myScripts/MyLib/MyFile.vim

source $myScripts/NotCareExtension/NotCareExtension.vim

source $myScripts/NotCareExtension/ExtensionObjects/Vim.vim

function! NotCareExtensionController(behavior) range

python <<EOM
import vim

extension = MyFile.getExtension()
behavior = vim.eval('a:behavior')
firstLine = int(vim.eval('a:firstline')) - 1
lastLine = int(vim.eval('a:lastline')) - 1

if extension == 'vim':
	extensionObject = Vim(behavior, firstLine, lastLine)

extensionObject.execute()
EOM

endfunction
