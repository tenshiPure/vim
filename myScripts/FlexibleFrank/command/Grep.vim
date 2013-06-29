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

		path = '/Users/ryo/Documents/gitvim/myScripts/FlexibleFrank'
		self.getAll(path, path)

#http://blog.lampetty.net/blog_ja/index.php/archives/418

EOM
