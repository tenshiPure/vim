#-*- coding: utf-8 -*-
import os.path
from nose.tools import *

from Base import Base
from Mkdir import Mkdir

class Mkdir_test(Base):

	def testExecute(self):
		Base.dirClean()
		targetDir = os.path.abspath(Base.testDir + '/MadeIt')

		eq_(False, os.path.isdir(targetDir))

		Mkdir().execute()

		eq_(True, os.path.isdir(targetDir))
