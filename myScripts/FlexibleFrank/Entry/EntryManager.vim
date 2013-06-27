python <<EOM
import sys
import vim
import os

class EntryManager:

	myBufName = ''
	targetDir = ''
	getEntryMode = ''
	entriesLimit = 0
	header = []
	entries = []
	linedEntries = {}

	#
	# 擬似コンストラクタ
	#
	def __init__(self, targetDir, myBufName):
		self.myBufName = myBufName
		self.targetDir = targetDir
		self.entries = []
		self.linedEntries = {}
		self.getEntryMode = 'all'
		self.entriesLimit = 200
		self.getEntries(self.targetDir, self.targetDir)

	#
	# エントリを生成する
	#
	def getEntries(self, head, dirPath):

		self.entries.append(Entry(head, dirPath))
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
					self.entries.append(Entry(head, fullPath))
					if self.isOverLimit():
						self.reGetEntries()

			elif self.getEntryMode == 'currentOnly':
				self.entries.append(Entry(head, fullPath))

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
	# ヘッダとエントリを出力する
	#
	def outputFrank(self):
		MyTab.switchTab(self.myBufName, 3)

		self.outputHeader()
		self.outputEntries()

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

		MyBuffer.initWorkingText(self.header)

	#
	# エントリを出力
	#
	def outputEntries(self):
		buf = vim.current.buffer

		line = len(buf) + 1
		for entry in self.entries:
			buf.append(entry.formatedForOutput)
			self.linedEntries[line] = entry
			line += 1

	#
	# ポイントをオンにする
	#
	def pointOn(self, firstLine, lastLine):
		cursor = MyCursor()
		cursor.storePos()

		for index in range(firstLine, lastLine + 1):
			self.linedEntries[index].pointOn()

		self.outputFrank()

		cursor.setPosAtStored()

	#
	# ポイントをオフにする
	#
	def pointOff(self, firstLine, lastLine):
		cursor = MyCursor()
		cursor.storePos()

		for index in range(firstLine, lastLine + 1):
			self.linedEntries[index].pointOff()

		self.outputFrank()

		cursor.setPosAtStored()

	#
	# 更新
	#
	def reloadFrank(self):
		self.entries = []
		self.linedEntries = {}
		self.getEntries(self.targetDir, self.targetDir)
		self.outputFrank()
		
EOM
