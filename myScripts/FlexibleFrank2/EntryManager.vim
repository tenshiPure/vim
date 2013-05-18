python <<EOM
import vim
import os

class EntryManager:

	targetDir = ''
	header = []
	entries = []
	linedEntries = {}

	#
	# 擬似コンストラクタ
	#
	def __init__(self, targetDir):
		self.targetDir = targetDir
		self.entries = []
		self.linedEntries = {}
		self.getEntries(self.targetDir, self.targetDir)

	#
	# エントリを生成
	#
	def getEntries(self, head, dirPath):

		if head != dirPath:
			self.entries.append(Entry(head, dirPath))

		for path in os.listdir(dirPath):
			fullPath = os.path.join(dirPath, path)

			if os.path.isdir(fullPath):
				self.getEntries(head, fullPath)
			elif os.path.isfile(fullPath):
				self.entries.append(Entry(head, fullPath))

	#
	# エントリ前のヘッダ部等を出力
	#
	def initWorkingText(self):
		cwd = os.getcwd()

		self.header = []
		self.header.append('----')
		self.header.append(self.targetDir)
		self.header.append('----')
		self.header.append('')

		myTab.initWorkingText(self.header)

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
#		if myTab.isFrank2():
#			return

		cursor = myCursor()
		cursor.storePos()

		for index in range(firstLine, lastLine + 1):
			self.linedEntries[index].pointOn()

		myTab.initWorkingText(self.header)
		self.outputEntries()

		cursor.setPosAtStored()

	#
	# ポイントをオフにする
	#
	def pointOff(self, firstLine, lastLine):
#		if myTab.isFrank2():
#			return

		cursor = myCursor()
		cursor.storePos()

		for index in range(firstLine, lastLine + 1):
			self.linedEntries[index].pointOff()

		myTab.initWorkingText(self.header)
		self.outputEntries()

		cursor.setPosAtStored()

	#
	# 更新
	#
	def reloadFrank(self):
		self.entries = []
		self.linedEntries = {}
		self.getEntries(self.targetDir, self.targetDir)
		self.initWorkingText()
		self.outputEntries()
		
EOM
