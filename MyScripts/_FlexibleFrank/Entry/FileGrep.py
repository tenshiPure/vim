# -*- coding:utf-8 -*-

from File import File
from Parts.OutputGrep import OutputGrep

class FileGrep(File):

	#
	# コンストラクタ
	#
	def __init__(self, path, grepResult):
		File.__init__(self, path.value)
		self.grepResult = grepResult
		self.output = OutputGrep(self.point, self.grepResult, self.path)
