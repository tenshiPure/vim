# -*- coding:utf-8 -*-
from Entry import Entry
from Parts.Type import Type

class File(Entry):

	#
	# コンストラクタ
	#
	def __init__(self, fullPath):
		Entry.__init__(self, Type.FILE, fullPath)
