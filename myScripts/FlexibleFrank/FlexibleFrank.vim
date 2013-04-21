python <<EOM
import vim
import sys

class FlexibleFrank:

	entries = []
	linedEntries = {}

	#
	# 擬似コンストラクタ
	#
	def __init__(self):
		self.entries = []
		self.linedEntries = {}

	#
	# 新規フランクを開く
	#
	def newFrank(self):
		myTab.openWorkingText('$myScripts/FlexibleFrank/WorkingText.frank')
		self.getEntries('./')
		self.outputHeaders()
		self.outputEntries()
	
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
	def getEntries(self, dirpath):
		cwd = os.getcwd()

		if dirpath != './':
			self.entries.append(Entry(cwd + dirpath.replace('./', '\\')))

		for path in os.listdir(dirpath):
			full = os.path.join(dirpath, path)

			if os.path.isdir(full):
				self.getEntries(full)
			elif os.path.isfile(full):
				self.entries.append(Entry(cwd + full.replace('./', '\\')))

	#
	# エントリ前のヘッダ部等を出力
	#
	def outputHeaders(self):
		myTab.clearCurrentBuffer()

		buf = vim.current.buffer
		cwd = os.getcwd()

		buf[0] = '-' * len(cwd) + '--------'
		buf.append('    ' + cwd)
		buf.append('-' * len(cwd) + '--------')
		buf.append('')

	#
	# エントリを出力
	#
	def outputEntries(self):
		buf = vim.current.buffer

		line = len(buf) + 1
		for entry in self.entries:
			buf.append(entry.formated)
			self.linedEntries[line] = entry
			line += 1

	#
	# コマンド　エンター
	#
	def commandEnter(self):
		if not(self.isWorkingText()):
			return

		currentLine = int(myCursor().getCursolLine())

		if currentLine < 5:
			return

		targetFullPath = self.linedEntries[currentLine].fullPath

		myTab.closeWorkingText()
		vim.command('tabedit ' + targetFullPath)

	#
	# 作業バッファかチェック
	#
	def isWorkingText(self):
		return vim.current.buffer.name.find('WorkingText.frank') != -1

EOM
