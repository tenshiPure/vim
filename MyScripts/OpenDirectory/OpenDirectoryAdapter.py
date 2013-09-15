#-*- coding: utf-8 -*-

import AutoLoader
import Util

#
# python用アダプタ
#
def OpenDirectoryAdapter(path):
	from Opener import Opener

	opener = Opener(path)
	opener.execute()

path = r'C:\Program Files (x86)\vim\gitvim\MyScripts\OpenDirectory'
OpenDirectoryAdapter(path)
