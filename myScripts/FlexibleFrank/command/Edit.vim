python <<EOM
import vim

class Edit:

	#
	# 対象ファイルをタブで開く
	#
	def execute(frank):
		targetEntries = Helper.getTargetEntries(frank)

		myTab.closeWorkingTexts()
		for targetEntry in targetEntries:

			if targetEntry.isDir:
				continue

			vim.command('tabedit ' + targetEntry.fullPath)

	execute = staticmethod(execute)
EOM
