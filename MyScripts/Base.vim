function! ConvertArgs(...)
	return a:000
endfunction

python <<EOM
import sys

sys.path.append(r'C:\Python27\Lib\site-packages\vim_bridge-0.5-py2.7.egg')
sys.path = list(set(sys.path))

from vim_bridge import bridged

import os.path
import vim
PATH_MY_SCRIPTS = os.path.abspath(vim.eval('$MyScripts'))

EOM
