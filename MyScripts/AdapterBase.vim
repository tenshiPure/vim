"
" 可変長引数をリストに変換する
"
function! ConvertArgs(...)
	return a:000
endfunction

python <<EOM

import vim
import sys
import os.path

PATH_MY_SCRIPTS = ''

#
# MyScriptsの定数定義
#
def defMyScripts():
	global PATH_MY_SCRIPTS
	PATH_MY_SCRIPTS = os.path.abspath(vim.eval('$MyScripts'))

#
# MyScriptsの取得
#
def getMyScripts():
	global PATH_MY_SCRIPTS
	return PATH_MY_SCRIPTS

#
# MyScripts配下のディレクトリをsys.pathに追加する
#
def sysPathAppendUnderMyScriptsPath(path):
	MyScriptsPath = os.path.abspath(os.path.join(PATH_MY_SCRIPTS, path))
	sysPathAppend(MyScriptsPath)
	
#
# sys.pathを重複させずに追加する
#
def sysPathAppend(path):
	sys.path.append(path)
	sys.path = list(set(sys.path))

sysPathAppend(r'C:\Python27\Lib\site-packages\vim_bridge-0.5-py2.7.egg')
from vim_bridge import bridged

defMyScripts()

EOM
