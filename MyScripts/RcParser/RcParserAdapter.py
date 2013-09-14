#-*- coding: utf-8 -*-

import os
import sys

sys.path.append(os.path.abspath(os.path.dirname(__file__) + '/..'))
import Util

#
# python用アダプタ
#
def RcParserAdapter():
	Util.sysPathAppendUnderMyScriptsPath('RcParser')
	import Parser

	env = Parser.getEnv()

	list = Parser.getList()

	result = Parser.parse(list, env)

	Parser.writeList(result)

RcParserAdapter()
