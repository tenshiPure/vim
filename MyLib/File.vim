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

EOM
