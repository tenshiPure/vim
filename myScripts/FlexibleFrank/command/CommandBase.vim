python <<EOM
import vim
from abc import ABCMeta, abstractmethod

class CommandBase:
	
	__metaclass__ = ABCMeta

	#
	# ポイントエントリもしくは範囲選択エントリを取得する
	#
	def getTargetEntries(self, frank, firstLine, lastLine):
		result = []
		for entry in frank.entries:
			if entry.pointed:
				result.append(entry)

		if len(result) == 0:
			for index in range(firstLine, lastLine + 1):
				result.append(frank.linedEntries[index])

		return result

	#
	# カーソル下のエントリを取得する
	#
	def getUnderCursorEntry(self, frank):
		currentLine = MyCursor().getCursorLineNum()
		return frank.linedEntries[currentLine]

	#
	# エントリが同一タイプのみか判定する
	#
	def isOnlySameTypeEntries(self, entries):
		return self.isDirOnly(entries) or self.isFileOnly(entries)

	#
	# エントリがディレクトリのみか判定する
	#
	def isDirOnly(self, entries):
		for entry in entries:
			if not(entry.isDir):
				return False
		return True

	#
	# エントリがファイルのみか判定する
	#
	def isFileOnly(self, entries):
		for entry in entries:
			if entry.isDir:
				return False
		return True

	#
	# エントリをフランク３へ出力する
	#
	def outputEntriesToFrank3(self, entries):
		MyTab.switchTab(pathFrank3, 3)

		buf = vim.current.buffer

		for entry in entries:
			buf.append(entry.entryName)

		del buf[0]

	#
	# 文字列をフランク３へ出力する
	#
	def outputStringToFrank3(self, string):
		MyTab.switchTab(pathFrank3, 3)

		vim.current.buffer[0] = string

	#
	# フランク３の文字列を取得する
	#
	def getLinesFromFrank3(self):
		MyTab.switchTab(pathFrank3, 3)
		return vim.current.buffer

	#
	# 実際の各コマンドの処理
	#
	@abstractmethod
	def execute(self):
		pass

EOM
