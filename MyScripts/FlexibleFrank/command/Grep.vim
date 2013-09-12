python <<EOM
import vim
import os
import re

class Grep(CommandBase):

	commandName = 'Grep'

	#
	# Grepを実行する
	#
	def execute(self, frank):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		path = vim.eval('$frank')
#		path = vim.eval('$frank') + '/command'
		pattern = 'execute'
		ignoreDirs = ['.git', 'cassfiles', 'WorkingText', 'Scripts']

		frank = GrepManager(path, pathFrank1, pattern, ignoreDirs)
		frank.outputFrank()

EOM
