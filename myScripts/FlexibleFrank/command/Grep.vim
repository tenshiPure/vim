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
#		search_dir = r'D:\grepsample'
#		search_pattern = "execute"

#		file_name_list = os.listdir(search_dir)
#		for file_name in file_name_list:
#			f = open(os.path.join(search_dir, file_name))
#			line = f.readline()
#			line_number = 1
#			while line:
#				m = re.search(search_pattern, line)
#				if m:
#					print "Pattern Found: file:%s, line:%d, data:%s" % (file_name, line_number, line)
#				line = f.readline()
#				line_number = line_number + 1
#			f.close()

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

EOM
