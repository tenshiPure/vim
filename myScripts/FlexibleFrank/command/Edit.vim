python <<EOM
import vim

class Edit:

	#
	# 対象ファイルをタブで開く
	#
	def execute(frank):
		if not(Helper.isWorkingText()):
			return

		targetEntries = Helper.getTargetEntries(frank)

		for targetEntry in targetEntries:

			if targetEntry.isDir:
				continue

			myTab.closeWorkingTexts()
			vim.command('tabedit ' + targetEntry.fullPath)

	execute = staticmethod(execute)
EOM
