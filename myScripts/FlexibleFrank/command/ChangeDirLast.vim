python <<EOM
import vim
import os

class ChangeDirLast(CommandBase):

	commandName = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, commandName):
		self.commandName = commandName

	#
	# 一つ前のディレクトリに移動する
	#
	def execute(self, frank):
		tmpLastDir = frank.targetDir

		frank.targetDir = os.path.abspath(Prev.lastDir)

		Prev.lastDir = tmpLastDir

		frank.reloadFrank()

EOM
