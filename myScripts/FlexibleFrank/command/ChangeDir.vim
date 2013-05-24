python <<EOM
import vim
import os

class ChangeDir:

	#
	# 指定したディレクトリに移動する
	#
	def execute(self, frank):
		targetEntry = CommandBase.getUnderCursorEntry(frank)

		if not(targetEntry.isDir):
			return

		ChangeDir.lastDir = frank.targetDir

		frank.targetDir = os.path.abspath(targetEntry.fullPath)

		frank.reloadFrank()

EOM
