#-*- coding: utf-8 -*-
import os.path

from nose.tools import eq_
from nose.tools import with_setup
from nose.plugins.attrib import attr

from Base import Base
from Mkdir import Mkdir

class Mkdir_test(Base):

	def setup(self):
		Base.dirClean()

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

	@with_setup(setup, teardown)
	def testExecute(self):
		Base.isFilesExists(self.originFiles, True)
		Base.isDirsExists(self.originDirs, True)
		Base.isDirsExists(self.targetDirs, False)

		self.sut.execute()

		Base.isFilesExists(self.originFiles, True)
		Base.isDirsExists(self.originDirs, True)
		Base.isDirsExists(self.targetDirs, True)

	@with_setup(setup, teardown)
	def testUnexecute(self):
		self.sut.execute()

		Base.isFilesExists(self.originFiles, True)
		Base.isDirsExists(self.originDirs, True)
		Base.isDirsExists(self.targetDirs, True)

		self.sut.unexecute()

		Base.isFilesExists(self.originFiles, True)
		Base.isDirsExists(self.originDirs, True)
		Base.isDirsExists(self.targetDirs, False)
