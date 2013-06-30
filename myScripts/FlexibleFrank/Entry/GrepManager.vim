python <<EOM

class GrepManager(BaseManager):

	#
	# コンストラクタ
	#
	def __init__(self, targetDir, myBufName, pattern, ignoreDirs):
		self.pattern = pattern
		self.ignoreDirs = ignoreDirs
		BaseManager.__init__(self, targetDir, myBufName)

	#
	# エントリを生成する
	#
	def getEntries(self, head, dirPath):
		fileNames = File.getFileNameRecursively(
			dirPath = self.targetDir, grep = self.pattern, ignoreDirs = self.ignoreDirs)

		for fileName in fileNames:
			self.entries.append(GrepEntry(head, fileName))
	#
	# エントリ前のヘッダ部等を出力
	#
	def outputHeader(self):
		cwd = os.getcwd()

		self.header = []
		self.header.append('')
		self.header.append('-' * len(self.pattern))
		self.header.append(self.pattern)
		self.header.append('-' * len(self.pattern))
		self.header.append('')

		Buffer.replaceBufferWithList(self.header)


EOM
