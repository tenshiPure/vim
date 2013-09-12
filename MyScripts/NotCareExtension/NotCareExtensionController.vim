"NotCareExtension

source $MyScripts/NotCareExtension/ExtensionObjects/Base.vim
source $MyScripts/NotCareExtension/ExtensionObjects/ahk.vim
source $MyScripts/NotCareExtension/ExtensionObjects/css.vim
source $MyScripts/NotCareExtension/ExtensionObjects/html.vim
source $MyScripts/NotCareExtension/ExtensionObjects/java.vim
source $MyScripts/NotCareExtension/ExtensionObjects/js.vim
source $MyScripts/NotCareExtension/ExtensionObjects/php.vim
source $MyScripts/NotCareExtension/ExtensionObjects/py.vim
source $MyScripts/NotCareExtension/ExtensionObjects/sh.vim
source $MyScripts/NotCareExtension/ExtensionObjects/tpl.vim
source $MyScripts/NotCareExtension/ExtensionObjects/vim_eo.vim

function! NotCareExtensionController(behavior, ...) range

python <<EOM
import vim

option = vim.eval('a:1') if vim.eval('a:0') == '1' else None

extension = File.getExtension(vim.current.buffer.name)
behavior = vim.eval('a:behavior')
firstLine = int(vim.eval('a:firstline'))
lastLine = int(vim.eval('a:lastline'))

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
