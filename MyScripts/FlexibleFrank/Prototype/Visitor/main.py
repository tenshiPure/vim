# -*- coding:utf-8 -*-
from Entry import Directory
from Entry import File

from Visitor import dumpVisitor

import os.path

rootPath = '/Users/ryo/Documents/gitvim/myScripts/NotCareExtension'
rootDir = Directory.Directory(rootPath)

visitor = dumpVisitor.dumpVisitor()

#rootDir.accept(visitor)

entry = rootDir.getEntry(os.path.join(rootPath, 'ExtensionObjects'))
entry.accept(visitor)
