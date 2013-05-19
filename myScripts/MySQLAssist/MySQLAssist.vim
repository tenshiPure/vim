python <<EOM
import vim

class GitAssist:

	command = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, command):
		self.command = 'r!' + command

	#
	# コマンド実行
	#
	def execute(self):
		vim.command('execute ":normal gw"')
		self.initCommandResult()
		vim.command(self.command)
		vim.command('execute ":normal gw"')

	#
	# 結果出力テキストの初期化
	#
	def initCommandResult(self):
		buf = vim.current.buffer
		del buf[:]
		buf[0]   = '-----------------------'
		buf.append('GitAssist CommandResult')
		buf.append('-----------------------')
		buf.append('')

		vim.command('execute ":normal G"')

EOM
