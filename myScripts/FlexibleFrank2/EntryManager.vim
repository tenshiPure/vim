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
#		self.getEntries('./')
		self.getEntries(targetDir)

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
	def getEntries(self, dirPath):
		cwd = os.getcwd()

		if dirPath != './':
			self.entries.append(Entry(cwd + dirPath.replace('./', os.sep)))

		for path in os.listdir(dirPath):
			full = os.path.join(dirPath, path)

			if path == '.git':
				continue

			if os.path.isdir(full):
				self.getEntries(full)
			elif os.path.isfile(full):
				self.entries.append(Entry(cwd + full.replace('./', os.sep)))

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
