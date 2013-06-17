python <<EOM
import vim

class CommandAssistantHistory:

	#
	# 擬似コンストラクタ
	#
	def __init__(self, history):
		self.history = history

	#
	# コマンド実行
	#
	def execute(self):
		if self.history == '':
			print 'blank line!'
			return

		self.lineNume = self.getCommandResultHistoryLineNum()
		self.moveCursor()

	#
	# 履歴詳細の行番号を得る
	#
	def getCommandResultHistoryLineNum(self):
		MyTab.switchTab(CommandResultHistory, 4)

		buf = vim.current.buffer

		for index, row in enumerate(buf):
			if row == self.history:
				return index + 1

	#
	# カーソル移動
	#
	def moveCursor(self):
		MyTab.switchTab(CommandResultHistory, 4)

		MyCursor().setPosOptional(self.lineNume, 0, 0)
		vim.command('execute ":normal zz"')
		
EOM
