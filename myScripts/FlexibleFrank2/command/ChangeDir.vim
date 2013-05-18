python <<EOM
import vim

class ChangeDir:

	#
	# 指定したディレクトリに移動する
	#
	def cd(frank, local = ''):
		targetEntry = Helper.getUnderCursorEntry(frank)

		if not(targetEntry.isDir):
			return

		if local == 'local':
			vim.command('lcd ' + targetEntry.fullPath)
		else:
			vim.command('cd ' + targetEntry.fullPath)

		frank.reloadFrank()

	#
	# 一つ上のディレクトリに移動する
	#
	def cdUpper(local = ''):
		if local == 'local':
			vim.command('lcd ../')
		else:
			vim.command('cd ../')

		frank.reloadFrank()

	#
	# 一つ前のディレクトリに移動する
	#
	def cdLast(local = ''):
		if local == 'local':
			vim.command('lcd -')
		else:
			vim.command('cd -')

		frank.reloadFrank()

	cd = staticmethod(cd)
	cdUpper = staticmethod(cdUpper)
	cdLast = staticmethod(cdLast)
EOM
