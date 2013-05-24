python <<EOM
import vim

class Edit:

	#
	# 対象ファイルをタブで開く
	#
	def execute(self, frank):
		targetEntries = CommandBase.getTargetEntries(frank, 'under')

		if CommandBase.isDirOnly(targetEntries):
			print 'edit ... not only dir'
			return

		tabCloser = TabCloser()
		tabCloser.execute()

		index = 0
		for targetEntry in targetEntries:

			if targetEntry.isDir:
				continue

			if index == 0 and MyTab.isBlankTab():
				vim.command('edit ' + targetEntry.fullPath)
			else:
				vim.command('tabedit ' + targetEntry.fullPath)

			index += 1

EOM
