#-*- coding: utf-8 -*-

import AutoLoader
import Util

#
# python用アダプタ
#
def WordCountAdapter(args):
	from Counter import Counter 

	counter = Counter(args)
	counter.execute()

WordCountAdapter(['mock', 'let'])
