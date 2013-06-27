python <<EOM

class MyFile:

	#
	# 拡張子を取得する
	#
	@staticmethod
	def getExtension(path):
		if MyFile.isDir(path):
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

EOM
