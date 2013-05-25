python <<EOM
import vim
from abc import ABCMeta, abstractmethod

class CommandBase:
	
	__metaclass__ = ABCMeta

	#
	# ポイントエントリもしくはカーソル下エントリを取得する
	#
	def getTargetEntries(self, frank, under = ''):
		result = []
		for entry in frank1.entries:
			if entry.pointed:
				result.append(entry)

		if under == 'under':
			if len(result) == 0:
				result.append(self.getUnderCursorEntry(frank))

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
	# 実際の各コマンドの処理
	#
	@abstractmethod
	def execute(self):
		pass

EOM
