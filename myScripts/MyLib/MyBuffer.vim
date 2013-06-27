python <<EOM

class MyBuffer:

	#
	# リストでバッファを置き換える
	#
	@staticmethod
	def replaceBufferWithList(list):
		buf = vim.current.buffer
		del buf[:]

		for row in list:
			buf.append(row)

		del buf[0]

	#
	# カレントバッファを空にする
	#
	@staticmethod
	def clearCurrentBuffer():
		vim.current.buffer[:] = None

	#
	# 作業テキストの初期化
	#
	@staticmethod
	def initWorkingText(header):
		buf = vim.current.buffer

		buf[:] = None

		for line in header:
			buf.append(line)

		del buf[0]

EOM
