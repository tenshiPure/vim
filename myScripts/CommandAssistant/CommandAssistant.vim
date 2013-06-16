python <<EOM
import vim

class CommandAssistant:

	#
	# 擬似コンストラクタ
	#
	def __init__(self, command):
		self.command = 'r!' + command

	#
	# コマンド実行
	#
	def execute(self):
		if self.command == 'r!':
			print 'blank line!'
			return

		self.initCommandResult()
		self.outputCommandResult()

		MyTab.switchTab(CommandList, 4)

	#
	# 結果出力テキストの初期化
	#
	def initCommandResult(self):
		MyTab.switchTab(CommandResult, 4)

		buf = vim.current.buffer
		del buf[:]

		vim.command('execute ":normal G"')

	#
	# 結果出力テキストに結果出力
	#
	def outputCommandResult(self):
		MyTab.switchTab(CommandResult, 4)

		vim.command(self.command)

EOM
