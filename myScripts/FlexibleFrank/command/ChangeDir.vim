python <<EOM
import vim
import os

class ChangeDir(CommandBase):

	commandName = 'ChangeDir'
	doneMessage = commandName + CommandBase.doneMessage

	#
	# 指定したディレクトリに移動する
	#
	def execute(self, frank):
		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		if not(targetEntry.isDir):
			raise TargetNotDirException(self.commandName)

		Prev.lastDir.append(frank.targetDir)

		frank.targetDir = os.path.abspath(targetEntry.fullPath)

		frank.reloadFrank()

		print self.doneMessage

EOM
