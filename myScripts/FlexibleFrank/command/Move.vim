python <<EOM
import vim

class Move:

	#
	# 指定したディレクトリに移動する
	#
	def move(frank):
		if not(Helper.isWorkingText()):
			return

		targetEntry = Helper.getUnderCursorEntry(frank)

		if not(targetEntry.isDir):
			return

		vim.command('cd ' + targetEntry.fullPath)
		frank.reloadFrank()

	#
	# 一つ上のディレクトリに移動する
	#
	def upperDir():
		if not(Helper.isWorkingText()):
			return

		vim.command('cd ../')
		frank.reloadFrank()

	#
	# 一つ前のディレクトリに移動する
	#
	def lastDir():
		if not(Helper.isWorkingText()):
			return

		vim.command('cd -')
		frank.reloadFrank()

	move = staticmethod(move)
	upperDir = staticmethod(upperDir)
	lastDir = staticmethod(lastDir)
EOM
