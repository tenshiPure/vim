#-*- coding: utf-8 -*-
import sys
import os
import os.path
import shutil

class Base:

	currentFile = __file__
	currentDir = os.path.dirname(currentFile)
	rootDir = currentDir + '/..'
	operateDir = os.path.join(rootDir, 'Operate')
	sys.path.append(operateDir)

	testDir = os.path.join(rootDir, 'TestDir')

	from Mkdir import Mkdir

	@staticmethod
	def dirClean():
		if os.path.isdir(Base.testDir):
			shutil.rmtree(Base.testDir)

		os.makedirs(Base.testDir)
		os.makedirs(os.path.join(Base.testDir, 'OriginA/OriginB'))

	@staticmethod
	def log(message):
		f = open(os.path.join(Base.currentDir, 'log.txt'), 'a')
		f.write(message + '\n')
		f.close()
