python <<EOM

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
		MyLib         = vim.eval('$lib')
		MyFundamental = vim.eval('$fundamental')
		MyScripts = vim.eval('$myScripts')

		#		files = []
		#		File.getAll(MyLib, files)
		#		for file in files:
		#			print file
		#
		#		files = []
		#		File.getAll(MyFundamental, files)
		#		for file in files:
		#			print file
		#
		#		files = []
		#		File.getAll(MyScripts, files)
		#		for file in files:
		#			print file

	#
	# 再帰的にフルパスを取得する 
	#
	@staticmethod
	def getAll(dirPath, files):
		for path in os.listdir(dirPath):
			fullPath = os.path.join(dirPath, path)

			if os.path.isdir(fullPath):
				File.getAll(fullPath, files)
			elif os.path.isfile(fullPath):
				files.append(fullPath)

		return files

EOM
