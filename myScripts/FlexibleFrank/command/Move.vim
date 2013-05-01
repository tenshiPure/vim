python <<EOM
import vim

class Move:

	#
	# 指定したディレクトリに移動する
	#
	def move(frank):
		targetEntry = Helper.getUnderCursorEntry(frank)

		if not(targetEntry.isDir):
			return

		vim.command('lcd ' + targetEntry.fullPath)
		frank.reloadFrank()

	#
	# 一つ上のディレクトリに移動する
	#
	def upperDir():
		vim.command('lcd ../')
		frank.reloadFrank()

	#
	# 一つ前のディレクトリに移動する
	#
	def lastDir():
		vim.command('lcd -')
		frank.reloadFrank()

	move = staticmethod(move)
	upperDir = staticmethod(upperDir)
	lastDir = staticmethod(lastDir)
EOM
