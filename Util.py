#-*- coding: utf-8 -*-

import os
import sys
import platform

PATH_MY_SCRIPTS = 'not definition'

#
# MyScriptsの定数定義
#
def defMyScripts():
	global PATH_MY_SCRIPTS
	if isPython():
		PATH_MY_SCRIPTS = os.path.dirname(__file__)
	if isVim():
		import vim
		PATH_MY_SCRIPTS = vim.eval('$MyScripts')

#
# MyScriptsの取得
#
def getMyScripts():
	global PATH_MY_SCRIPTS
	return PATH_MY_SCRIPTS

#
# win判定
#
def isWin():
	return platform.system() == 'Windows'

#
# mac判定
#
def isMac():
	return platform.system() == 'Darwin'

#
# python判定
#
def isPython():
	try:
		import vim
		return False
	except:
		return True

#
# vim判定
#
def isVim():
	try:
		import vim
		return True
	except:
		return False

defMyScripts()
