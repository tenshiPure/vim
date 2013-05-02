python <<EOM
import vim

class Rename:

	beforeEntries = []
	#
	# リネーム対象を別バッファに表示する
	#
	def renameBuf(frank):
		if myTab.isFrank2():
			return

		targetEntries = Helper.getTargetEntries(frank)
		if not(Helper.isOnlySameTypeEntries(targetEntries)):
			return

		myTab.openMoreWorkingText('$myScripts/FlexibleFrank/RenameWorkingText.frank')
		frank.single = False
		myTab.clearCurrentBuffer()
		buf = vim.current.buffer

		index = 0
		for targetEntry in targetEntries:
			buf[index] = targetEntry.fullPath
			buf.append('')
			index += 1
		del buf[index]

		Rename.beforeEntries = targetEntries

	#
	# リネームを実行する
	#
	def renameFix():
		if myTab.isFrank1() or myTab.isFrank2():
			print 'fix ... only frank3'
			return

		buf = vim.current.buffer
		renamedEntries = []

		index = 0
		for index in range(len(buf)):
			renamedEntries.append(Entry(buf[index]))
			index += 1

		if len(Rename.beforeEntries) != len(renamedEntries):
			print 'Number of beforeEntry and afterEntry do not match. I can\'t execute.'
			return


		for index in range(len(renamedEntries)):
			beforePutDir = Rename.beforeEntries[index].putDir
			afterPutDir = renamedEntries[index].putDir

			if beforePutDir != afterPutDir:
				print 'Dirctory Changed. I can\'t execute.'
				return

		for index in range(len(renamedEntries)):
			before = myString.surround(Rename.beforeEntries[index].fullPath, '"')
			after = myString.surround(renamedEntries[index].entryName, '"')

			vim.command('silent !rename ' + before + ' ' + after)

	renameBuf = staticmethod(renameBuf)
	renameFix = staticmethod(renameFix)
EOM
