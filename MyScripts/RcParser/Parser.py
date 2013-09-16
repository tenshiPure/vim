#-*- coding: utf-8 -*-
import os.path
import re
import codecs

PATH_RC = os.path.abspath(os.path.dirname(__file__) + '../../../rc')
PATH_ENV = os.path.abspath(PATH_RC + '/env')
PATH_IN = os.path.abspath(PATH_RC + '/vimrc_non_replace.vim')
PATH_OUT = os.path.abspath(PATH_RC + '/vimrc_replaced.vim')

def getEnv():
	return open(PATH_ENV, 'r').read().rstrip('\r\n')

def getList():
	result = []

	file = codecs.open(PATH_IN, 'r', 'UTF-8')
	for line in file:
		result.append(line)
	file.close()

	return result

def parse(list, env):
	winPattern = r'.*@win.*'
	macPattern = r'.*@mac.*'
	blankPattern = r'^[\s\t]*$'

	winModifiers = {'Mod1' : 'M', }

	winFlag = False
	macFlag = False

	winList = []
	macList = []
	for line in list:
		if re.search(winPattern, line):
			winFlag = True
			macFlag = False

		if re.search(macPattern, line):
			winFlag = False
			macFlag = True

		if re.search(blankPattern, line):
			winFlag = False
			macFlag = False


		if winFlag or (not winFlag and not macFlag):
			winList.append(line)

		if macFlag or (not winFlag and not macFlag):
			macList.append(line)

	return {'win' : winList, 'mac' : macList}[env]

def writeList(list):
	file = codecs.open(PATH_OUT, 'w', 'UTF-8')
	file.writelines(list)
	file.close()
