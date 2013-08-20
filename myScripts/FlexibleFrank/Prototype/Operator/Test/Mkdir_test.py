#-*- coding: utf-8 -*-
import os.path
from nose.tools import *

from Base import Base
from Mkdir import Mkdir

class Mkdir_test(Base):

	def testExecute(self):
		Base.dirClean()
		targetDirs = []

		targetDirs.append('MadeIt')
		targetDirs.append('SubA/SubB/SubC')
		targetDirs.append('SubX/SubY')
		targetDirs.append('SubX/SubZ')
		targetDirs.append('OriginA/MadeIt')
		targetDirs.append('OriginA/SubA/SubB/SubC')
		targetDirs.append('OriginA/SubX/SubY')
		targetDirs.append('OriginA/SubX/SubZ')

		for targetDir in targetDirs:
			dir = os.path.join(Base.testDir, targetDir)
			eq_(False, os.path.isdir(dir), dir)

		sut = Mkdir(Base.testDir, targetDirs)
		sut.execute()

		for targetDir in targetDirs:
			dir = os.path.join(Base.testDir, targetDir)
			eq_(True, os.path.isdir(dir), dir)

		Base.dirClean()
