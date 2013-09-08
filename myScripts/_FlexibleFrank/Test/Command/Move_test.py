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

	def teardown(self):
		Base.dirClean()

	@with_setup(Base.dirClean, Base.dirClean)
	def test(self):
		pairPaths1 = []
		pairPaths2 = []

		src1 = Base.joinRootPath('OriginA.txt')
		dst1 = Base.joinRootPath('OriginA_moved.txt')
		pairPaths1.append(PairPath(src1, dst1))

		src2 = Base.joinRootPath('OriginA')
		dst2 = Base.joinRootPath('OriginA_moved')
		pairPaths1.append(PairPath(src2, dst2))

		src3 = Base.joinRootPath('OriginX/OriginY.txt')
		dst3 = Base.joinRootPath('OriginX/OriginY_moved.txt')
		pairPaths2.append(PairPath(src3, dst3))

		src4 = Base.joinRootPath('OriginX/OriginY')
		dst4 = Base.joinRootPath('OriginX/OriginY_moved')
		pairPaths2.append(PairPath(src4, dst4))

		sut1 = Move(pairPaths1)
		sut2 = Move(pairPaths2)

		eq_(Base.isExists(src1), True)
		eq_(Base.isExists(dst1), False)
		eq_(Base.isExists(src2), True)
		eq_(Base.isExists(dst2), False)
		eq_(Base.isExists(src3), True)
		eq_(Base.isExists(dst3), False)
		eq_(Base.isExists(src4), True)
		eq_(Base.isExists(dst4), False)

		sut1.execute()

		eq_(Base.isExists(src1), False)
		eq_(Base.isExists(dst1), True)
		eq_(Base.isExists(src2), False)
		eq_(Base.isExists(dst2), True)
		eq_(Base.isExists(src3), True)
		eq_(Base.isExists(dst3), False)
		eq_(Base.isExists(src4), True)
		eq_(Base.isExists(dst4), False)

		sut2.execute()

		eq_(Base.isExists(src1), False)
		eq_(Base.isExists(dst1), True)
		eq_(Base.isExists(src2), False)
		eq_(Base.isExists(dst2), True)
		eq_(Base.isExists(src3), False)
		eq_(Base.isExists(dst3), True)
		eq_(Base.isExists(src4), False)
		eq_(Base.isExists(dst4), True)

		sut2.unexecute()

		eq_(Base.isExists(src1), False)
		eq_(Base.isExists(dst1), True)
		eq_(Base.isExists(src2), False)
		eq_(Base.isExists(dst2), True)
		eq_(Base.isExists(src3), True)
		eq_(Base.isExists(dst3), False)
		eq_(Base.isExists(src4), True)
		eq_(Base.isExists(dst4), False)

		sut1.unexecute()

		eq_(Base.isExists(src1), True)
		eq_(Base.isExists(dst1), False)
		eq_(Base.isExists(src2), True)
		eq_(Base.isExists(dst2), False)
		eq_(Base.isExists(src3), True)
		eq_(Base.isExists(dst3), False)
		eq_(Base.isExists(src4), True)
		eq_(Base.isExists(dst4), False)
