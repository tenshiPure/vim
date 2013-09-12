#-*- coding: utf-8 -*-
class Dollar:

	def __init__(self, amount = 0):
		self.amount = amount

	def times(self, multiplier):
		self.amount *= multiplier
