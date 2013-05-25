python <<EOM
import vim
import os

class ChangeDirUpper(CommandBase):

	commandName = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, commandName):
		self.commandName = commandName

	#
	# 一つ上のディレクトリに移動する
	#
	def execute(self, frank):
		Prev.lastDir = frank.targetDir

		frank.targetDir = os.path.abspath(frank.targetDir + '/../')

		frank.reloadFrank()

EOM
