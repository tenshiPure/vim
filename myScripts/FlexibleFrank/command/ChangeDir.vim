python <<EOM
import vim
import os

class ChangeDir(CommandBase):

	commandName = ''

	#
	# 擬似コンストラクタ
	#
	def __init__(self, commandName):
		self.commandName = commandName

	#
	# 指定したディレクトリに移動する
	#
	def execute(self, frank):
		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		if not(targetEntry.isDir):
			raise TargetNotDirException(self.commandName)

		Prev.lastDir = frank.targetDir

		frank.targetDir = os.path.abspath(targetEntry.fullPath)

		frank.reloadFrank()

EOM
