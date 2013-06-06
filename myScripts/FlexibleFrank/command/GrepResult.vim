python <<EOM
import re

class GrepResult():

	fullPath = ''
	putDir = ''
	entryName = ''
	lineNum = ''
	match = ''

	#
	# コンストラクタ
	#
	def __init__(self, result):
		self.fullPath = re.search( r'^[^:]*', result).group()
		self.putDir = self.fullPath.rsplit(os.sep, 1)[0]
		self.entryName = self.fullPath.rsplit(os.sep, 1)[1]
		self.lineNum = re.search(r'^\d*', result[len(self.fullPath) + 1 :]).group()
		self.match = result[len(self.fullPath) + 1 + len(self.lineNum) + 1 : -1]

EOM
