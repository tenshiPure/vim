#-*- coding: utf-8 -*-

import os
import sys

sys.path.append(os.path.abspath(os.path.dirname(__file__) + '/..'))
import AdapterBase

#
# python用アダプタ
#
def WordCountAdapter(args):
	AdapterBase.defMyScripts()

	AdapterBase.sysPathAppendUnderMyScriptsPath('../MyFundamental')

	AdapterBase.sysPathAppendUnderMyScriptsPath('WordCount')
	from Counter import Counter 

	counter = Counter(args)
	counter.execute()

WordCountAdapter(['map', 'let'])
