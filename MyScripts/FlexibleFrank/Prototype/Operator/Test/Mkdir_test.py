#-*- coding: utf-8 -*-
import os.path

from nose.tools import eq_
from nose.tools import with_setup
from nose.plugins.attrib import attr

from Base import Base
from Mkdir import Mkdir

class Move_test(Base):

	def setup(self):
		Base.dirClean()

	def teardown(self):
		Base.dirClean()

	@with_setup(Base.dirClean, Base.dirClean)
	def test(self):
		dir1 = Base.joinRootPath('MadeIt')
		dir2 = Base.joinRootPath('SubA/SubB/SubC')
		dir3 = Base.joinRootPath('SubX/SubY')
		dir4 = Base.joinRootPath('SubX/SubZ')
		dir5 = Base.joinRootPath('OriginA/MadeIt')
		dir6 = Base.joinRootPath('OriginA/SubA/SubB/SubC')
		dir7 = Base.joinRootPath('OriginA/SubX/SubY')
		dir8 = Base.joinRootPath('OriginA/SubX/SubZ')

		sut1 = Mkdir(Base.testDir, [dir1, dir2, dir3, dir4])
		sut2 = Mkdir(Base.testDir, [dir5, dir6, dir7, dir8])

		eq_(Base.isExists(dir1), False)
		eq_(Base.isExists(dir2), False)
		eq_(Base.isExists(dir3), False)
		eq_(Base.isExists(dir4), False)
		eq_(Base.isExists(dir5), False)
		eq_(Base.isExists(dir6), False)
		eq_(Base.isExists(dir7), False)
		eq_(Base.isExists(dir8), False)

		sut1.execute()

		eq_(Base.isExists(dir1), True)
		eq_(Base.isExists(dir2), True)
		eq_(Base.isExists(dir3), True)
		eq_(Base.isExists(dir4), True)
		eq_(Base.isExists(dir5), False)
		eq_(Base.isExists(dir6), False)
		eq_(Base.isExists(dir7), False)
		eq_(Base.isExists(dir8), False)

		sut2.execute()

		eq_(Base.isExists(dir1), True)
		eq_(Base.isExists(dir2), True)
		eq_(Base.isExists(dir3), True)
		eq_(Base.isExists(dir4), True)
		eq_(Base.isExists(dir5), True)
		eq_(Base.isExists(dir6), True)
		eq_(Base.isExists(dir7), True)
		eq_(Base.isExists(dir8), True)

		sut2.unexecute()

		eq_(Base.isExists(dir1), True)
		eq_(Base.isExists(dir2), True)
		eq_(Base.isExists(dir3), True)
		eq_(Base.isExists(dir4), True)
		eq_(Base.isExists(dir5), False)
		eq_(Base.isExists(dir6), False)
		eq_(Base.isExists(dir7), False)
		eq_(Base.isExists(dir8), False)

		sut1.unexecute()

		eq_(Base.isExists(dir1), False)
		eq_(Base.isExists(dir2), False)
		eq_(Base.isExists(dir3), False)
		eq_(Base.isExists(dir4), False)
		eq_(Base.isExists(dir5), False)
		eq_(Base.isExists(dir6), False)
		eq_(Base.isExists(dir7), False)
		eq_(Base.isExists(dir8), False)
