python <<EOM
#-*- coding: utf-8 -*-

import os
import os.path
import sys
import vim

Gitvim = vim.eval('$gitvim')
MyScripts = os.path.abspath(Gitvim + '/MyScripts')
MyFundamental = os.path.abspath(Gitvim + '/MyFundamental')
VimBridgeWin = r'C:\Python27\Lib\site-packages\vim_bridge-0.5-py2.7.egg'
VimBridgeMac = '/Library/Python/2.7/site-packages/vim_bridge-0.5-py2.7.egg'

sys.path.append(Gitvim)
sys.path.append(MyFundamental)
sys.path.append(VimBridgeWin)
sys.path.append(VimBridgeMac)

for path in os.listdir(MyScripts):
	fullPath = os.path.join(MyScripts, path)
	if os.path.isdir(fullPath):
		sys.path.append(fullPath)

sys.path = list(set(sys.path))
EOM
