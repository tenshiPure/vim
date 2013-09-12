python <<EOM

class NormalManager(BaseManager):

	#
	# コンストラクタ
	#
	def __init__(self, targetDir, myBufName):
		self.getEntryMode = 'all'
		self.entriesLimit = 200
		BaseManager.__init__(self, targetDir, myBufName)

	#
	# エントリを生成する
	#
	def getEntries(self, head, dirPath):

		self.entries.append(NormalEntry(head, dirPath))
		if self.getEntryMode == 'all':
			if self.isOverLimit():
				self.reGetEntries()

		for path in os.listdir(dirPath):
			fullPath = os.path.join(dirPath, path)

			if path == '.git':
				continue

			if self.getEntryMode == 'all':
				if os.path.isdir(fullPath):
					self.getEntries(head, fullPath)
				elif os.path.isfile(fullPath):
					self.entries.append(NormalEntry(head, fullPath))
					if self.isOverLimit():
						self.reGetEntries()

			elif self.getEntryMode == 'currentOnly':
				self.entries.append(NormalEntry(head, fullPath))

	#
	# エントリの数が上限を超えていないか判定する
	#
	def isOverLimit(self):
		if len(self.entries) > self.entriesLimit:
			return True
		else:
			return False

	#
	# エントリの取得モードを切り替える
	#
	def switchGetEntryMode(self):
		if self.getEntryMode == 'all':
			self.getEntryMode = 'currentOnly'
			self.entriesLimit = 200
		else:
			self.getEntryMode = 'all'
			self.entriesLimit = sys.maxint

	#
	# エントリの取得モードを切り替えてエントリを再取得する
	#
	def reGetEntries(self):
		print self.getEntryMode
		self.entries = []
		self.switchGetEntryMode()
		self.getEntries(self.targetDir, self.targetDir)

	#
	# エントリ前のヘッダ部等を出力
	#
	def outputHeader(self):
		cwd = os.getcwd()

		self.header = []
		self.header.append('')
		self.header.append('-' * len(self.targetDir))
		self.header.append(self.targetDir)
		self.header.append('-' * len(self.targetDir))
		self.header.append('')

		Buffer.replaceBufferWithList(self.header)

EOM
