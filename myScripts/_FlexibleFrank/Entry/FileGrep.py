# -*- coding:utf-8 -*-

from File import File
from Parts.OutputGrep import OutputGrep

class FileGrep(File):

	#
	# コンストラクタ
	#
	def __init__(self, fullPath, grepResults):
		File.__init__(self, fullPath)
		self.grepResults = grepResults
		self.output = OutputGrep(self.point, self.grepResults, self.path)
