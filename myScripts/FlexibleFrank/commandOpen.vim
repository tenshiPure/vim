python <<EOM
import vim

class commandOpen:

	#
	# ディレクトリを開く
	#
	def openDir(fullPath):
		if os.name == 'nt':
			vim.command('silent !explorer ' + fullPath)
		else:
			vim.command('execute silent !open ' + fullPath)

	openDir = staticmethod(openDir)
EOM
