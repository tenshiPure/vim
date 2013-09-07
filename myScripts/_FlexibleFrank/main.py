# -*- coding:utf-8 -*-
from Entry import Directory
from Entry import File
from Entry import GrepFile
from Entry import Entry

import os.path

rootPath = os.path.abspath(os.path.dirname(__file__) + '/TestDir')

Entry.Entry.init(rootPath)
rootDir = Directory.Directory(rootPath)
#rootDir.dump(['id', 'entryName'])

#for entry in rootDir.loop(lambda entry: 3 == entry.id):
#	entry.dumpRec(['id', 'entryName'])

subDir = rootDir.loop(lambda entry: entry.id == 3).next()
#subDir.dumpRec()

#Entry.Entry.init(rootPath)
#grepRootDir = Directory.Directory(rootPath, recursive = False)
#for entry in rootDir.loop():
#	grepResults = entry.grep('log', 'is')
#	if grepResults:
#		grepFile = GrepFile.GrepFile(entry.fullPath, grepResults)
#		grepFile.dump()

idRange = rootDir.range('^', '4')
rootDir.pointsToggle(idRange)

rootDir.dumpRec()
