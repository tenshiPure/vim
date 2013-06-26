"NotCareExtension

source $myScripts/MyLib/MyFile.vim

source $myScripts/NotCareExtension/ExtensionObjects/Base.vim
source $myScripts/NotCareExtension/ExtensionObjects/ahk.vim
source $myScripts/NotCareExtension/ExtensionObjects/css.vim
source $myScripts/NotCareExtension/ExtensionObjects/html.vim
source $myScripts/NotCareExtension/ExtensionObjects/java.vim
source $myScripts/NotCareExtension/ExtensionObjects/js.vim
source $myScripts/NotCareExtension/ExtensionObjects/php.vim
source $myScripts/NotCareExtension/ExtensionObjects/py.vim
source $myScripts/NotCareExtension/ExtensionObjects/sh.vim
source $myScripts/NotCareExtension/ExtensionObjects/tpl.vim
source $myScripts/NotCareExtension/ExtensionObjects/vim_eo.vim

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


if   extension == 'ahk':
	extensionObject = ahk(behavior, firstLine, lastLine, fileName)
elif extension == 'css':
	extensionObject = css(behavior, firstLine, lastLine, fileName)
elif extension == 'html':
	extensionObject = html(behavior, firstLine, lastLine, fileName)
elif extension == 'java':
	extensionObject = js(behavior, firstLine, lastLine, fileName)
elif extension == 'php':
	extensionObject = php(behavior, firstLine, lastLine, fileName)
elif extension == 'py':
	extensionObject = py(behavior, firstLine, lastLine, fileName)
elif extension == 'sh':
	extensionObject = sh(behavior, firstLine, lastLine, fileName)
elif extension == 'tpl':
	extensionObject = tpl(behavior, firstLine, lastLine, fileName)
elif extension == 'vim':
	extensionObject = vim_eo(behavior, firstLine, lastLine, fileName)

extensionObject.execute()

EOM

endfunction
