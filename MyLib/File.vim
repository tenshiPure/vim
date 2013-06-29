python <<EOM

import re

class File:

	#
	# 拡張子を取得する
	#
	@staticmethod
	def getExtension(path):
		if File.isDir(path):
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
	# 配下のファイルを読み込む
	#
	@staticmethod
	def roadVimFiles():
		find = '.vim$'
		ignoreDirs = ['.git', 'rc']
		gitvim = vim.eval('$gitvim')
		files = File.getFileNameRecursively(dirPath = gitvim, find = find, ignoreDirs = ignoreDirs)

		for fileName in files:
			vim.command('source ' + fileName)

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
				if re.search(find, fullPath) is None:
					pass
				elif File.tmpGrep():
					pass
				else:
					files.append(fullPath)

		return files

	#
	# tmp
	#
	@staticmethod
	def tmpGrep():
		return False

EOM
