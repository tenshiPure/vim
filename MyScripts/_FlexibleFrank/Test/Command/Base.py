#-*- coding: utf-8 -*-
import sys
import os
import os.path
import shutil

from nose.tools import eq_

class Base:

	currentFile = __file__
	currentDir = os.path.dirname(currentFile)
	rootDir = currentDir + '/..'
	operateDir = os.path.join(rootDir, 'Operate')
	sys.path.append(operateDir)

	testDir = os.path.join(rootDir, 'TestDir')
	trashPath = os.path.join(operateDir, 'TrashBox')

	originDirs = []
	originDirs.append(os.path.join(testDir, 'OriginA/OriginB'))
	originDirs.append(os.path.join(testDir, 'OriginX/OriginY'))

	originFiles = []
	originFiles.append(os.path.join(testDir, 'OriginA.txt'))
	originFiles.append(os.path.join(testDir, 'OriginA/OriginB.txt'))
	originFiles.append(os.path.join(testDir, 'OriginX.txt'))
	originFiles.append(os.path.join(testDir, 'OriginX/OriginY.txt'))

	@staticmethod
	def dirClean():
		if os.path.isdir(Base.testDir):
			shutil.rmtree(Base.testDir)

		for originDir in Base.originDirs:
			os.makedirs(originDir)

		for originFile in Base.originFiles:
			f = open(originFile, 'w')
			f.write('')
			f.close()

		if os.path.isdir(Base.trashPath):
			shutil.rmtree(Base.trashPath)

		os.makedirs(Base.trashPath)

	@staticmethod
	def log(message):
		f = open(os.path.join(Base.currentDir, 'log.txt'), 'a')
		f.write(message + '\n')
		f.close()

	@staticmethod
	def isExists(entry):
		if os.path.isfile(entry) or os.path.isdir(entry):
			return True
		else:
			return False

	@staticmethod
	def joinRootPath(tailPath):
		return os.path.abspath(os.path.join(Base.testDir, tailPath))

	@staticmethod
	def joinTrashPath(tailPath):
		return os.path.abspath(os.path.join(Base.trashPath, tailPath))
