python <<EOM
import vim
import os
import re

class Grep(CommandBase):

	commandName = 'Grep'
	grepResultObjects = {}

	#
	# Grepを実行する
	#
	def execute(self, frank):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		path = vim.eval('$frank') + '/command'
		grep = 'execute'
		ignoreDirs = ['.git', 'cassfiles', 'WorkingText', 'Scripts']
		fileNames = File.getFileNameRecursively(dirPath = path, grep = grep, ignoreDirs = ignoreDirs)

		for filename in fileNames:
			print filename

EOM
