python <<EOM
import vim

class Delete:

	#
	# 対象を削除する
	#
	def execute(frank):
		if myTab.isFrank2():
			return

		targetEntries = Helper.getTargetEntries(frank)

		for targetEntry in targetEntries:
			if not(targetEntry.isDir):
				if os.name == 'nt':
					vim.command('!del "' + targetEntry.fullPath + '"')
				else:
					vim.command('!rm "' + targetEntry.fullPath + '"')

			if targetEntry.isDir:
				if os.name == 'nt':
					vim.command('!rmdir /s /q "' + targetEntry.fullPath + '"')
				else:
					vim.command('!rm -r "' + targetEntry.fullPath + '"')

	execute = staticmethod(execute)
EOM
