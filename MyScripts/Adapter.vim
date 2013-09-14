"
" 可変長引数をリストに変換する
"
function! ConvertArgs(...)
	return a:000
endfunction

python <<EOM

import sys
sys.path.append(r'C:\Python27\Lib\site-packages\vim_bridge-0.5-py2.7.egg')

EOM
