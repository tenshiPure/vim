python <<EOM
import vim
import os

class ChangeDirLast:

	#
	# 一つ前のディレクトリに移動する
	#
	def execute(self, frank):
		tmpLastDir = frank.targetDir

		frank.targetDir = os.path.abspath(ChangeDir.lastDir)

		ChangeDir.lastDir = tmpLastDir

		frank.reloadFrank()

EOM
