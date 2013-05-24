python <<EOM
import vim
import os

class ChangeDir(CommandBase):

	#
	# 指定したディレクトリに移動する
	#
	def execute(self, frank):
		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		if not(targetEntry.isDir):
			return

		Prev.lastDir = frank.targetDir

		frank.targetDir = os.path.abspath(targetEntry.fullPath)

		frank.reloadFrank()

EOM
