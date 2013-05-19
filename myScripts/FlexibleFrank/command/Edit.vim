python <<EOM
import vim

class Edit:

	#
	# 対象ファイルをタブで開く
	#
	@staticmethod
	def execute(frank):
		targetEntries = Helper.getTargetEntries(frank, 'under')

		tabCloser = TabCloser()
		tabCloser.execute()

		for targetEntry in targetEntries:

			if targetEntry.isDir:
				continue

			vim.command('tabedit ' + targetEntry.fullPath)

EOM
