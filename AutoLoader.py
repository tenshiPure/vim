#-*- coding: utf-8 -*-

import os
import os.path
import sys

Gitvim = os.path.dirname(__file__)
MyScripts = os.path.abspath(Gitvim + '/MyScripts')
MyFundamental = os.path.abspath(Gitvim + '/MyFundamental')

sys.path.append(Gitvim)
sys.path.append(MyFundamental)

for path in os.listdir(MyScripts):
	fullPath = os.path.join(MyScripts, path)
	if os.path.isdir(fullPath):
		sys.path.append(fullPath)

sys.path = list(set(sys.path))
