# -*- coding:utf-8 -*-
from abc import ABCMeta, abstractmethod

class Visitor:

	__metaclass__ = ABCMeta

	def visit(self, entry):
		if entry.isFile():
			self.visitFile(entry)

		if entry.isDirectory():
			self.visitDirectory(entry)

	@abstractmethod
	def visitFile(self, entry):
		pass

	@abstractmethod
	def visitDirectory(self, entry):
		pass
