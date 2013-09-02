# -*- coding:utf-8 -*-
from Entry import Directory
from Entry import File
from Entry import Entry

import os.path

rootPath = os.path.abspath(os.path.dirname(__file__) + '/subA')

Entry.Entry.setRootPath(rootPath)
rootDir = Directory.Directory(rootPath)
#rootDir.dump()

subDir = rootDir.getById(3)
subDir.dump()
