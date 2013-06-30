python <<EOM

import re

class File:

	#
	# 拡張子を取得する
	#
	@staticmethod
	def getExtension(path):
		if path is None:
			return ''
		elif File.isDir(path):
			return ''
		else:
			try:
				return path.rsplit('.', 1)[1]
			except IndexError:
				return ''

	#
	# ディレクトリかどうかを判定
	#
	@staticmethod
	def isDir(path):
		return os.path.isdir(path)

	#
	# 再帰的にフルパスを取得する 
	#
	@staticmethod
	def getFileNameRecursively(dirPath, files = [], grep = '', find = '', ignoreDirs = []):
		for path in os.listdir(dirPath):
			fullPath = os.path.join(dirPath, path)

			if path in ignoreDirs:
				continue

			if os.path.isdir(fullPath):
				File.getFileNameRecursively(fullPath, files = files, find = find, ignoreDirs = ignoreDirs)
			elif os.path.isfile(fullPath):
				if File.find(find, fullPath) and File.grep(grep, fullPath):
					files.append(fullPath)

		return files

	#
	# find
	#
	@staticmethod
	def find(pattern, string):
		if re.search(pattern, string) is None:
			return False
		else:
			return True

	#
	# grep
	#
	@staticmethod
	def grep(pattern, fileName):
		if pattern == '':
			return True
		with open(fileName) as file:
			for lineNum, line in enumerate(file):
				if File.find(pattern, line):
					return True

EOM
