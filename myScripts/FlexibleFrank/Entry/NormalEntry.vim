python <<EOM

class NormalEntry(BaseEntry):

	#
	# コンストラクタ
	#
	def __init__(self, head, fullPath):
		BaseEntry.__init__(self, head, fullPath)

	#
	# 出力フォーマット
	#
	def createFormatedForOutput(self):
		point = '*' if self.pointed else ''
		tab = '\t' * self.depth
		space = ' ' if self.isDir else ''

		return point + tab + self.entryName + space

EOM
