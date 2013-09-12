# -*- coding:utf-8 -*-
from Visitor import Visitor

class dumpVisitor(Visitor):

	def visitFile(self, entry):
		print 'File : ' + entry.fullPath

	def visitDirectory(self, entry):
		print 'Dir  : ' + entry.fullPath

		for e in entry.entries:
			e.accept(self)
