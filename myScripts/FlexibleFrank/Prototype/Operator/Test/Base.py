#-*- coding: utf-8 -*-
import sys
import os
import os.path
import shutil

class Base:

	currentFile = __file__
	currentDir = os.path.dirname(currentFile)
	rootDir = currentDir + '/..'
	operateDir = os.path.abspath(rootDir + '/Operate')
	sys.path.append(operateDir)

	testDir = os.path.abspath(rootDir + '/TestDir')

	from Mkdir import Mkdir

	@staticmethod
	def dirClean():
		if os.path.isdir(Base.testDir):
			shutil.rmtree(Base.testDir)

		os.makedirs(Base.testDir)
