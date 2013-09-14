#-*- coding: utf-8 -*-

import os
import sys

sys.path.append(os.path.abspath(os.path.dirname(__file__) + '/..'))
import AdapterBase

#
# python用アダプタ
#
def RcParserAdapter():
	AdapterBase.defMyScripts()

	AdapterBase.sysPathAppendUnderMyScriptsPath('RcParser')
	import Parser

	env = Parser.getEnv()

	list = Parser.getList()

	result = Parser.parse(list, env)

	Parser.writeList(result)

RcParserAdapter()
