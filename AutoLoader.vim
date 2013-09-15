python <<EOM
#-*- coding: utf-8 -*-

import os
import os.path
import sys
import vim

root = vim.eval('$gitvim')
MyScripts = os.path.abspath(root + '/MyScripts')
MyFundamental = os.path.abspath(root + '/MyFundamental')
VimBridge = r'C:\Python27\Lib\site-packages\vim_bridge-0.5-py2.7.egg'

sys.path.append(MyFundamental)
sys.path.append(VimBridge)

for path in os.listdir(MyScripts):
	fullPath = os.path.join(MyScripts, path)
	if os.path.isdir(fullPath):
		sys.path.append(fullPath)

sys.path = list(set(sys.path))
EOM
