python <<EOM

import vim
import os.path

class myFile:

	#
	# カレントバッファの拡張子取得
	#
	@staticmethod
	def getExtension():
		tmpRoot, extension = os.path.splitext(vim.current.buffer.name)
		return extension[1:]

EOM
