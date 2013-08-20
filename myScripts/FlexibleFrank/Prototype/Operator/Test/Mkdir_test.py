#-*- coding: utf-8 -*-
import os.path
from nose.tools import *

from Base import Base
from Mkdir import Mkdir

class Mkdir_test(Base):

	def setup(self):
		Base.dirClean()

		self.originDirs = []

		self.originDirs.append(Base.testDir)
		self.originDirs.append(os.path.join(Base.testDir, 'OriginA/OriginB'))

		self.targetDirs = []

		self.targetDirs.append('MadeIt')
		self.targetDirs.append('SubA/SubB/SubC')
		self.targetDirs.append('SubX/SubY')
		self.targetDirs.append('SubX/SubZ')
		self.targetDirs.append('OriginA/MadeIt')
		self.targetDirs.append('OriginA/SubA/SubB/SubC')
		self.targetDirs.append('OriginA/SubX/SubY')
		self.targetDirs.append('OriginA/SubX/SubZ')

		self.sut = Mkdir(Base.testDir, self.targetDirs)

	def teardown(self):
		Base.dirClean()

	def isDirsExists(self, dirs, expect):
		for targetDir in dirs:
			dir = os.path.join(Base.testDir, targetDir)
			eq_(expect, os.path.isdir(dir))

	@with_setup(setup, teardown)
	def testExecute(self):
		self.isDirsExists(self.originDirs, True)
		self.isDirsExists(self.targetDirs, False)

		self.sut.execute()

		self.isDirsExists(self.originDirs, True)
		self.isDirsExists(self.targetDirs, True)

	@with_setup(setup, teardown)
	def testUnexecute(self):
		self.sut.execute()

		self.isDirsExists(self.originDirs, True)
		self.isDirsExists(self.targetDirs, True)

		self.sut.unexecute()

		self.isDirsExists(self.originDirs, True)
		self.isDirsExists(self.targetDirs, False)
