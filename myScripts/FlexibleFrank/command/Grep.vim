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

		search_dir = r'D:\grepsample'
		search_pattern = "execute"

		file_name_list = os.listdir(search_dir)
		for file_name in file_name_list:
			f = open(os.path.join(search_dir, file_name))
			line = f.readline()
			line_number = 1
			while line:
				m = re.search(search_pattern, line)
				if m:
					print "Pattern Found: file:%s, line:%d, data:%s" % (file_name, line_number, line)
				line = f.readline()
				line_number = line_number + 1
			f.close()


	
	#
	# 文字列型のgrep結果を改行パースし、各行をGrepResultオブジェクトとして辞書化する
	#
	def makeGrepResultObjects(self, result):
		rows = result.split('\n')
		rows.pop(0)
		rows.pop(0)
		rows.pop(-1)

		rtnDict = {}
		for index, row in enumerate(rows):
			rtnDict[index] = GrepResultEntry(row)

		return rtnDict

EOM
