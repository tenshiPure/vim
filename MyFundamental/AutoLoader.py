#-*- coding: utf-8 -*-

import os
import os.path
import sys

root = os.path.dirname(__file__) + '/..'
MyScripts = os.path.abspath(root + '/MyScripts')
MyFundamental = os.path.abspath(root + '/MyFundamental')

sys.path.append(root)
sys.path.append(MyFundamental)

for path in os.listdir(MyScripts):
	fullPath = os.path.join(MyScripts, path)
	if os.path.isdir(fullPath):
		sys.path.append(fullPath)

sys.path = list(set(sys.path))
