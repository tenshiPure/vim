#-*- coding: utf-8 -*-

import os
import sys

PATH_MY_SCRIPTS = 'not definition'

#
# MyScriptsの定数定義
#
def defMyScripts():
	global PATH_MY_SCRIPTS
	PATH_MY_SCRIPTS = os.path.dirname(__file__)

#
# MyScriptsの取得
#
def getMyScripts():
	global PATH_MY_SCRIPTS
	return PATH_MY_SCRIPTS

#
# MyScripts配下のディレクトリをsys.pathに追加する
#
def sysPathAppendUnderMyScriptsPath(path):
	MyScriptsPath = os.path.abspath(os.path.join(PATH_MY_SCRIPTS, path))
	sysPathAppend(MyScriptsPath)
	
#
# sys.pathを重複させずに追加する
#
def sysPathAppend(path):
	sys.path.append(path)
	sys.path = list(set(sys.path))
