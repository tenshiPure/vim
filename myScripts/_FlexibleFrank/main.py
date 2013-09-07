# -*- coding:utf-8 -*-
from Entry import Directory
from Entry import File
from Entry import GrepFile
from Entry import Entry
from Entry.Range import Range

import os.path

rootPath = os.path.abspath(os.path.dirname(__file__) + '/TestDir')

Entry.Entry.initialize(rootPath)
rootDir = Directory.Directory(rootPath)

#for entry in rootDir.loop(lambda entry: 3 == entry.id):
#	pass

#subDir = rootDir.loop(lambda entry: entry.id == 3).next()

#Entry.Entry.initialize(rootPath)
#grepRootDir = Directory.Directory(rootPath, recursive = False)
#for entry in rootDir.loop():
#	grepResults = entry.grep('log', 'is')
#	if grepResults:
#		grepFile = GrepFile.GrepFile(entry.fullPath, grepResults)

#
# 範囲
#
range = Range(rootDir, '^', '4')
rootDir.pointsSwitch(range)

#
# ポイント
#
for e in rootDir.loop():
	print e.id
	print e.type
	print e.point
	print ' '
