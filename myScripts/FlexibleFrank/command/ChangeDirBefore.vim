python <<EOM
import vim
import os

class ChangeDirBefore(CommandBase):

	commandName = 'ChangeDirBefore'
	doneMessage = commandName + CommandBase.doneMessage

	#
	# 一つ前のディレクトリに移動する
	#
	def execute(self, frank):
		if len(Prev.lastDir) == 0:
			raise NoMoreBeforeDirException(self.commandName)
		else:
			frank.targetDir = Prev.lastDir.pop()

		frank.reloadFrank()

		print self.doneMessage

EOM
