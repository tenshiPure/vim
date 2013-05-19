python <<EOM
import vim
import os

class ChangeDir:

	lastDir = ''

	#
	# 指定したディレクトリに移動する
	#
	@staticmethod
	def cd(frank):
		targetEntry = Helper.getUnderCursorEntry(frank)

		if not(targetEntry.isDir):
			return

		ChangeDir.lastDir = frank.targetDir

		frank.targetDir = os.path.abspath(targetEntry.fullPath)

		frank.reloadFrank()

	#
	# 一つ上のディレクトリに移動する
	#
	@staticmethod
	def cdUpper(frank):
		ChangeDir.lastDir = frank.targetDir

		frank.targetDir = os.path.abspath(frank.targetDir + '/../')

		frank.reloadFrank()

	#
	# 一つ前のディレクトリに移動する
	#
	@staticmethod
	def cdLast(frank):
		tmpLastDir = frank.targetDir

		frank.targetDir = os.path.abspath(ChangeDir.lastDir)

		ChangeDir.lastDir = tmpLastDir

		frank.reloadFrank()

EOM
