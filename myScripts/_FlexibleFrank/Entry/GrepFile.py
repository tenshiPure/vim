# -*- coding:utf-8 -*-
from Entry import Entry

class GrepFile(Entry):

	#
	# コンストラクタ
	#
	def __init__(self, fullPath, grepResults):
		self.grepResults = grepResults
		Entry.__init__(self, 'file', fullPath)

	#
	# 出力用文字列
	#
	def getFormatedForOutput(self):
		grep = '\n'
		for grepResult in self.grepResults:
			grep += '%5d : %s\n' % (grepResult[0], grepResult[1])

		point = '*' if self.pointed else ''
		return point + self.fullPath + grep
