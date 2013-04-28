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

		myTab.closeWorkingText()
		for targetEntry in targetEntries:

			if targetEntry.isDir:
				continue

			vim.command('tabedit ' + targetEntry.fullPath)

	execute = staticmethod(execute)
EOM
