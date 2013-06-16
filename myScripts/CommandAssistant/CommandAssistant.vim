python <<EOM
import datetime
import vim

class CommandAssistant:

	#
	# 擬似コンストラクタ
	#
	def __init__(self, command):
		self.command = command

	#
	# コマンド実行
	#
	def execute(self):
		if self.command == '':
			print 'blank line!'
			return

		self.timestanp = self.createTimestanp()

		self.commandResult = MyString.commandRedirect(self.command)

		self.outputCommandResult()
		self.outputCommandListHistory()
		self.outputCommandResultHistory()

		MyTab.switchTab(CommandList, 4)

	#
	# タイムスタンプを作成
	#
	def createTimestanp(self):
		now = datetime.datetime.now()
		return now.strftime("%Y/%m/%d - %H:%M:%S") + " - %04d" % (now.microsecond // 1000)

	#
	# 結果を出力
	#
	def outputCommandResult(self):
		MyTab.switchTab(CommandResult, 4)
		MyString.replaceBufferWithList(self.commandResult)

	#
	# コマンド履歴を出力
	#
	def outputCommandListHistory(self):
		file = open(CommandListHistory, 'a')
		file.write(self.timestanp + "     " + self.command + '\n')
		file.close

	#
	# 結果履歴を出力
	#
	def outputCommandResultHistory(self):
		file = open(CommandResultHistory, 'a')
		file.write(self.timestanp + ' begin' + '\n')
		for row in self.commandResult:
			file.write(row + '\n')
		file.write(self.timestanp + ' end' + '\n' + '\n' + '\n')
		file.close

EOM
