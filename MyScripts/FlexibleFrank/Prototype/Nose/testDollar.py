#-*- coding: utf-8 -*-
from sample1 import Dollar
from nose.tools import *

class TestDollar:

	def testMultiplication(self):
		five = Dollar(5)
		five.times(2)
		eq_(10, five.amount)
