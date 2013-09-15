#-*- coding: utf-8 -*-

import os
import sys

import AutoLoader
import Util

#
# python用アダプタ
#
def RcParserAdapter():
	import Parser

	env = Parser.getEnv()

	list = Parser.getList()

	result = Parser.parse(list, env)

	Parser.writeList(result)

RcParserAdapter()
