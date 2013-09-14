#-*- coding: utf-8 -*-

import os
import sys

sys.path.append(os.path.abspath(os.path.dirname(__file__) + '/..'))
import AdapterBase

#
# python用アダプタ
#
def OpenDirectoryAdapter(path):
	AdapterBase.defMyScripts()

	AdapterBase.sysPathAppendUnderMyScriptsPath('OpenDirectory')
	from Opener import Opener

	opener = Opener(path)
	opener.execute()

path = r'C:\Program Files (x86)\vim\gitvim\MyScripts\OpenDirectory'
OpenDirectoryAdapter(path)
