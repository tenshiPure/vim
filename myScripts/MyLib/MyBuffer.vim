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

EOM
