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

	#
	# 
	#
	def getAll(self, head, dirPath):
		for path in os.listdir(dirPath):
			fullPath = os.path.join(dirPath, path)

			if os.path.isdir(fullPath):
				self.getAll(head, fullPath)
			elif os.path.isfile(fullPath):
				print fullPath

#http://blog.lampetty.net/blog_ja/index.php/archives/418

EOM
