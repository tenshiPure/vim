# -*- coding:utf-8 -*-
from Entry import Entry

class File(Entry):

	def __init__(self, fullPath):
		Entry.__init__(self, 'file', fullPath)
