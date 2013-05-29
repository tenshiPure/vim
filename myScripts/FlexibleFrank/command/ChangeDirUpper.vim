python <<EOM
import vim
import os

class ChangeDirUpper(CommandBase):

	commandName = 'ChangeDirUpper'
	doneMessage = commandName + CommandBase.doneMessage

	#
	# 一つ上のディレクトリに移動する
	#
	def execute(self, frank):
		Prev.lastDir.append(frank.targetDir)

		frank.targetDir = os.path.abspath(frank.targetDir + '/../')

		frank.reloadFrank()

		print self.doneMessage

EOM
