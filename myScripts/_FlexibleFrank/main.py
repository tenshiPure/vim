# -*- coding:utf-8 -*-
from Entry import Directory
from Entry import File
from Entry import Entry

import os.path

rootPath = os.path.abspath(os.path.dirname(__file__) + '/TestDir')

Entry.Entry.setRootPath(rootPath)
rootDir = Directory.Directory(rootPath)
#rootDir.dump(['id', 'entryName'])

#for entry in rootDir.loop(lambda entry: 3 == entry.id):
#	entry.dumpRec(['id', 'entryName'])

#subDir = rootDir.loop(lambda entry: entry.id == 3).next()
#subDir.dumpRec()

grepRootDir = Directory.Directory(rootPath, recursive = False)
for entry in rootDir.loop():
	print entry.grep('log', 'is')
