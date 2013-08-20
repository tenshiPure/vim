#-*- coding: utf-8 -*-
import os.path

from nose.tools import eq_
from nose.tools import with_setup
from nose.plugins.attrib import attr

from Base import Base
from Copy import Copy
from PairPath import PairPath

class Copy_test(Base):

	def setup(self):
		Base.dirClean()

		self.pairPaths = []

		src = os.path.abspath(os.path.join(Base.testDir, 'OriginA.txt'))
		dst = os.path.abspath(os.path.join(Base.testDir, 'OriginA_copied.txt'))
		self.pairPaths.append(PairPath(src, dst))

		src = os.path.abspath(os.path.join(Base.testDir, 'OriginX/OriginY.txt'))
		dst = os.path.abspath(os.path.join(Base.testDir, 'OriginX/OriginY_copied.txt'))
		self.pairPaths.append(PairPath(src, dst))

		src = os.path.abspath(os.path.join(Base.testDir, 'OriginA'))
		dst = os.path.abspath(os.path.join(Base.testDir, 'OriginA_copied'))
		self.pairPaths.append(PairPath(src, dst))

		src = os.path.abspath(os.path.join(Base.testDir, 'OriginX/OriginY'))
		dst = os.path.abspath(os.path.join(Base.testDir, 'OriginX/OriginY_copied'))
		self.pairPaths.append(PairPath(src, dst))

		self.sut = Copy(self.pairPaths)

		self.expectedFiles = []
		self.expectedFiles.append(os.path.join(Base.testDir, 'OriginA_copied.txt'))
		self.expectedFiles.append(os.path.join(Base.testDir, 'OriginA_copied/OriginB.txt'))
		self.expectedFiles.append(os.path.join(Base.testDir, 'OriginX/OriginY_copied.txt'))

		self.expectedDirs = []
		self.expectedDirs.append(os.path.join(Base.testDir, 'OriginA_copied'))
		self.expectedDirs.append(os.path.join(Base.testDir, 'OriginA_copied/OriginB'))
		self.expectedDirs.append(os.path.join(Base.testDir, 'OriginX/OriginY_copied'))

	def teardown(self):
		Base.dirClean()

	@with_setup(setup, teardown)
	def testExecute(self):
		Base.isFilesExists(self.originFiles, True)
		Base.isDirsExists(self.originDirs, True)
		Base.isFilesExists(self.expectedFiles, False)
		Base.isDirsExists(self.expectedDirs, False)

		self.sut.execute()

		Base.isFilesExists(self.originFiles, True)
		Base.isDirsExists(self.originDirs, True)
		Base.isFilesExists(self.expectedFiles, True)
		Base.isDirsExists(self.expectedDirs, True)

	@with_setup(setup, teardown)
	def testUnexecute(self):
		self.sut.execute()

		Base.isFilesExists(self.originFiles, True)
		Base.isDirsExists(self.originDirs, True)
		Base.isFilesExists(self.expectedFiles, True)
		Base.isDirsExists(self.expectedDirs, True)

		self.sut.unexecute()

		Base.isFilesExists(self.originFiles, True)
		Base.isDirsExists(self.originDirs, True)
		Base.isFilesExists(self.expectedFiles, False)
		Base.isDirsExists(self.expectedDirs, False)
