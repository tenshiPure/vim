#-*- coding: utf-8 -*-
import os.path

from nose.tools import eq_
from nose.tools import with_setup
from nose.plugins.attrib import attr

from Base import Base
from Move import Move
from PairPath import PairPath

class Move_test(Base):

	def setup(self):
		Base.dirClean()

		self.pairPaths = []

		src = os.path.abspath(os.path.join(Base.testDir, 'OriginA'))
		dst = os.path.abspath(os.path.join(Base.testDir, 'OriginA_moved'))
		self.pairPaths.append(PairPath(src, dst))

		src = os.path.abspath(os.path.join(Base.testDir, 'OriginX/OriginY'))
		dst = os.path.abspath(os.path.join(Base.testDir, 'OriginX/OriginY_moved'))
		self.pairPaths.append(PairPath(src, dst))

		src = os.path.abspath(os.path.join(Base.testDir, 'OriginA.txt'))
		dst = os.path.abspath(os.path.join(Base.testDir, 'OriginA_moved.txt'))
		self.pairPaths.append(PairPath(src, dst))

		src = os.path.abspath(os.path.join(Base.testDir, 'OriginX/OriginY.txt'))
		dst = os.path.abspath(os.path.join(Base.testDir, 'OriginX/OriginY_moved.txt'))
		self.pairPaths.append(PairPath(src, dst))

		self.sut = Move(self.pairPaths)

		self.expectedFiles = []
		self.expectedFiles.append(os.path.join(Base.testDir, 'OriginA_moved.txt'))
		self.expectedFiles.append(os.path.join(Base.testDir, 'OriginA_moved/OriginB.txt'))
		self.expectedFiles.append(os.path.join(Base.testDir, 'OriginX/OriginY_moved.txt'))

		self.expectedDirs = []
		self.expectedDirs.append(os.path.join(Base.testDir, 'OriginA_moved'))
		self.expectedDirs.append(os.path.join(Base.testDir, 'OriginA_moved/OriginB'))
		self.expectedDirs.append(os.path.join(Base.testDir, 'OriginX/OriginY_moved'))

	def teardown(self):
		return
		Base.dirClean()

	@with_setup(setup, teardown)
	def testExecute(self):
		Base.isFilesExists(self.expectedFiles, False)
		Base.isDirsExists(self.expectedDirs, False)

		self.sut.execute()

		Base.isFilesExists(self.expectedFiles, True)
		Base.isDirsExists(self.expectedDirs, True)

	@attr(wip=True)
	@with_setup(setup, teardown)
	def testUnexecute(self):
		self.sut.execute()

		Base.isFilesExists(self.expectedFiles, True)
		Base.isDirsExists(self.expectedDirs, True)

		self.sut.unexecute()

		Base.isFilesExists(self.expectedFiles, False)
		Base.isDirsExists(self.expectedDirs, False)
