#-*- coding: utf-8 -*-
import os.path

from nose.tools import eq_
from nose.tools import with_setup
from nose.plugins.attrib import attr

from Base import Base
from Remove import Remove

class Move_test(Base):

	def setup(self):
		Base.dirClean()

	def teardown(self):
		Base.dirClean()

	@with_setup(Base.dirClean, Base.dirClean)
	def test(self):
		src1 = Base.joinRootPath('OriginA.txt')
		dst1 = Base.joinTrashPath('OriginA.txt')

		src2 = Base.joinRootPath('OriginA')
		dst2 = Base.joinTrashPath('OriginA')

		src3 = Base.joinRootPath('OriginX/OriginY.txt')
		dst3 = Base.joinTrashPath('OriginY.txt')

		src4 = Base.joinRootPath('OriginX/OriginY')
		dst4 = Base.joinTrashPath('OriginY')

		sut1 = Remove([src1, src2])
		sut2 = Remove([src3, src4])

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
