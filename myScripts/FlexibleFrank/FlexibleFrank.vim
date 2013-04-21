python <<EOM
import vim

class FlexibleFrank:

	linedEntries = {}

	#
	# 擬似コンストラクタ
	#
	def __init__(self):
		self.linedEntries = {}

	#
	# 新規フランクを開く
	#
	def newFrank(self):
		myTab.openWorkingText('$myScripts/FlexibleFrank/WorkingText.frank')
		myTab.clearCurrentBuffer()
		tmpEntries = self.getEntries()
		sortedEntries = self.sortEntries(tmpEntries)
		self.createLinedEntries(sortedEntries)
		self.outputEntries()
		
	#
	# エントリを生成
	#
	def getEntries(self):
		result = []

		for headPath, dirs, files in os.walk(os.getcwd()):
			for dir in dirs:
				result.append(Entry(headPath + os.sep + dir))
			for file in files:
				result.append(Entry(headPath + os.sep + file))

		return result

	#
	# エントリをソート
	#
	def sortEntries(self, target):
		tmpSorted = {}
		result = []
		for entry in target:
			tmpSorted[entry.underCurrentDepth] = entry

		for key in sorted(tmpSorted.keys()):
			result.append(tmpSorted[key])

		return result

	#
	# エントリを行数に紐付ける
	#
	def createLinedEntries(self, target):

		index = 0
		for entry in target:
			self.linedEntries[index] = entry
			index += 1

	#
	# エントリを出力
	#
	def outputEntries(self):
		buf = vim.current.buffer

		for index in range(len(self.linedEntries)):
			buf.append('')

		for index in range(len(self.linedEntries)):
			buf[index] = self.linedEntries[index].entryName

EOM
