# -*- coding:utf-8 -*-
from Entry import Directory
from Entry import File
from Entry import Entry

import os.path

rootPath = os.path.abspath(os.path.dirname(__file__) + '/TestDir')

Entry.Entry.setRootPath(rootPath)
rootDir = Directory.Directory(rootPath)
rootDir.dump(['id', 'entryName'])
#rootDir.dump()

#for entry in rootDir.loop(lambda entry: 3 == entry.id):
#	entry.dump()

#for e in rootDir.loop():
#	print e.id
