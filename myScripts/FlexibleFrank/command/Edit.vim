python <<EOM
import vim

class Edit:

	#
	# 対象ファイルをタブで開く
	#
	def execute(frank):
		if not(Helper.isWorkingText()):
			return

		targetEntry = Helper.getUnderCursorEntry(frank)

		if targetEntry.isDir:
			return

		myTab.closeWorkingText()
		vim.command('tabedit ' + targetEntry.fullPath)

	execute = staticmethod(execute)
EOM
