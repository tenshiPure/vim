#-*- coding: utf-8 -*-

import os
import sys

sys.path.append(os.path.abspath(os.path.dirname(__file__) + '/..'))
import Util

#
# python用アダプタ
#
def WordCountAdapter(args):
	Util.sysPathAppendUnderMyScriptsPath('../MyFundamental')

	Util.sysPathAppendUnderMyScriptsPath('WordCount')
	from Counter import Counter 

	counter = Counter(args)
	counter.execute()

WordCountAdapter(['mock', 'let'])
