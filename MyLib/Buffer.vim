python <<EOM

class Buffer:

	#
	# リストでバッファを置き換える
	#
	@staticmethod
	def replaceBufferWithList(list):
		Buffer.clearCurrentBuffer()

		for line in list:
			vim.current.buffer.append(line)
		del vim.current.buffer[0]

	#
	# カレントバッファを空にする
	#
	@staticmethod
	def clearCurrentBuffer():
		vim.current.buffer[:] = None

EOM
