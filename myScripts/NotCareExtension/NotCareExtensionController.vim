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

option = vim.eval('a:1') if vim.eval('a:0') == '1' else None

extension = MyFile.getExtension(vim.current.buffer.name)
behavior = vim.eval('a:behavior')
firstLine = int(vim.eval('a:firstline')) - 1
lastLine = int(vim.eval('a:lastline')) - 1

if   extension == 'ahk':
	extensionObject = ahk(behavior, firstLine, lastLine, option)
elif extension == 'css':
	extensionObject = css(behavior, firstLine, lastLine, option)
elif extension == 'html':
	extensionObject = html(behavior, firstLine, lastLine, option)
elif extension == 'java':
	extensionObject = js(behavior, firstLine, lastLine, option)
elif extension == 'php':
	extensionObject = php(behavior, firstLine, lastLine, option)
elif extension == 'py':
	extensionObject = py(behavior, firstLine, lastLine, option)
elif extension == 'sh':
	extensionObject = sh(behavior, firstLine, lastLine, option)
elif extension == 'tpl':
	extensionObject = tpl(behavior, firstLine, lastLine, option)
elif extension == 'vim':
	extensionObject = vim_eo(behavior, firstLine, lastLine, option)

extensionObject.execute()

EOM

endfunction
