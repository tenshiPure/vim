python <<EOM
import vim
import os
import os.path

class OpenDirectory:

	#
	# コンストラクタ
	#
	def __init__(self, path):
		self.dirPath = self.adjustPath(path)

	#
	# パスを調整
	#
	def adjustPath(self, path):
		if os.path.isfile(path):
			return os.path.abspath(os.path.dirname(path))

		elif os.path.isdir(path):
			return os.path.abspath(path)

	#
	# 実行
	#
	def execute(self):
		if os.name == 'nt':
			vim.command(r'silent !explorer "%s"' % (self.dirPath))
		else:
			vim.command('silent !open ' + self.dirPath)

EOM
