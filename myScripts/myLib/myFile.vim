python <<EOM

import vim
import os.path

class myFile:

	#
	# カレントバッファの拡張子取得
	#
	def getExtension():
		tmpRoot, extension = os.path.splitext(vim.current.buffer.name)
		return extension[1:]

	getExtension = staticmethod(getExtension)

EOM
