python <<EOM
import vim

class Delete:

	#
	# 対象を削除する
	#
	@staticmethod
	def execute(frank):
		targetEntries = Helper.getTargetEntries(frank)

		for targetEntry in targetEntries:
			if not(targetEntry.isDir):
				if os.name == 'nt':
					vim.command('silent !del "' + targetEntry.fullPath + '"')
				else:
					vim.command('silent !rm "' + targetEntry.fullPath + '"')

			if targetEntry.isDir:
				if os.name == 'nt':
					vim.command('silent !rmdir /s /q "' + targetEntry.fullPath + '"')
				else:
					vim.command('silent !rm -r "' + targetEntry.fullPath + '"')

EOM
