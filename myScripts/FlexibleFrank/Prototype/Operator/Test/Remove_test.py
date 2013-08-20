#-*- coding: utf-8 -*-
import os.path

from nose.tools import eq_
from nose.tools import with_setup
from nose.plugins.attrib import attr

from Base import Base
from Remove import Remove
from PairPath import PairPath

class Remove_test(Base):

	def setup(self):
		Base.dirClean()

		self.targetFiles = []
		self.targetFiles.append(os.path.abspath(os.path.join(Base.testDir, 'OriginA.txt')))

		self.targetDirs = []
		self.targetDirs.append(os.path.abspath(os.path.join(Base.testDir, 'OriginA')))

		self.trashedFiles = []
		self.trashedFiles.append(os.path.abspath(os.path.join(Base.trashPath, 'OriginA.txt')))

		self.trashedDirs = []
		self.trashedDirs.append(os.path.abspath(os.path.join(Base.trashPath, 'OriginA')))

		self.sut = Remove(self.targetFiles + self.targetDirs)

	def teardown(self):
		Base.dirClean()

	@attr(wip=True)
	@with_setup(setup, teardown)
	def testExecute(self):
		Base.isFilesExists(self.targetFiles, True)
		Base.isDirsExists(self.targetDirs, True)
		Base.isFilesExists(self.trashedFiles, False)
		Base.isDirsExists(self.trashedDirs, False)

		self.sut.execute()

		Base.isFilesExists(self.targetFiles, False)
		Base.isDirsExists(self.targetDirs, False)
		Base.isFilesExists(self.trashedFiles, True)
		Base.isDirsExists(self.trashedDirs, True)

	@with_setup(setup, teardown)
	def testUnexecute(self):
		self.sut.execute()

		Base.isFilesExists(self.expectedFiles, True)
		Base.isDirsExists(self.expectedDirs, True)

		self.sut.unexecute()

		Base.isFilesExists(self.expectedFiles, False)
		Base.isDirsExists(self.expectedDirs, False)
