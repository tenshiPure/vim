# -*- coding:utf-8 -*-
from Entry import Directory
from Entry import File

import os.path

#$frank/prototype
rootPath = os.path.abspath(os.path.dirname(__file__) + '/../')
rootDir = Directory.Directory(rootPath)

subDir = Directory.Directory(rootPath + '/Operator')

#subDir.dump()
