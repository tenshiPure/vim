python <<EOM
import vim
import os

class EntryManager:

	entries = []
	linedEntries = {}

	#
	# 擬似コンストラクタ
	#
	def __init__(self, targetDir):
		self.entries = []
		self.linedEntries = {}
		self.getEntries(targetDir, targetDir)
#		self.getEntries('./')

	#
	# 更新
	#
	def reloadFrank(self):
		self.entries = []
		self.linedEntries = {}
		self.getEntries('./')
		self.outputHeaders()
		self.outputEntries()
		
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
	def initWorkingText(self, targetDir):
		cwd = os.getcwd()

		header = []
		header.append('----')
		header.append(targetDir)
		header.append('----')
		header.append('')

		myTab.initWorkingText(header)

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
		if myTab.isFrank2():
			return

		cursor = myCursor()
		cursor.storePos()

		for index in range(firstLine, lastLine + 1):
			self.linedEntries[index].pointOn()

		self.outputHeaders()
		self.outputEntries()

		cursor.setPosAtStored()

	#
	# ポイントをオフにする
	#
	def pointOff(self, firstLine, lastLine):
		if myTab.isFrank2():
			return

		cursor = myCursor()
		cursor.storePos()

		for index in range(firstLine, lastLine + 1):
			self.linedEntries[index].pointOff()

		self.outputHeaders()
		self.outputEntries()

		cursor.setPosAtStored()
EOM
