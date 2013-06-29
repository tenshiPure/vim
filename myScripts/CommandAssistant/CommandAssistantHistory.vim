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
		Tab.switchTab(CommandResultHistory, 4)

		buf = vim.current.buffer

		for index, row in enumerate(buf):
			if row == self.history:
				return index + 1

	#
	# カーソル移動
	#
	def moveCursor(self):
		Tab.switchTab(CommandResultHistory, 4)

		pos = (0, self.lineNume, 0, 0)
		Cursor.setPos(pos)
		vim.command('execute ":normal zz"')
		
EOM
