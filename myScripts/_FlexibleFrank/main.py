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

findRootDir = Directory.Directory(rootPath, recursive = False)
for entry in rootDir.loop(lambda entry: entry.isFind(pattern = 'Sub', ignorePattern = '[A-C]')):
	entry.dump(['id', 'fullPath'])

#for entry in rootDir.loop(lambda entry: entry.isFind(pattern = 'Sub', ignorePattern = None)):
#	entry.dump(['id', 'fullPath'])

#for entry in rootDir.loop(lambda entry: entry.isFind(pattern = None, ignorePattern = '[A-C]')):
#	entry.dump(['id', 'fullPath'])
