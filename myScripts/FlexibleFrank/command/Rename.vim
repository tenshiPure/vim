python <<EOM
import vim

class Rename:

	beforeEntries = []
	#
	# リネーム対象を別バッファに表示する
	#
	@staticmethod
	def renameBuf(frank):
		targetEntries = Helper.getTargetEntries(frank)

		if len(targetEntries) == 0:
			print 'rename ... no pointed'
			return

		if not(Helper.isOnlySameTypeEntries(targetEntries)):
			print 'rename ... only same type entries'
			return

		MyTab.switchTab(pathFrank3, 3)

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
	@staticmethod
	def renameFix():
		if vim.current.buffer.name == pathFrank1 or vim.current.buffer.name == pathFrank2:
			print 'fix ... Rename only'
			return

		buf = vim.current.buffer
		renamedEntries = []

		index = 0
		for index in range(len(buf)):
			renamedEntries.append(Entry('hogeHead', buf[index]))
			index += 1

		if len(Rename.beforeEntries) != len(renamedEntries):
			print 'fix ... number of beforeEntry and afterEntry do not match'
			return

		for index in range(len(renamedEntries)):
			beforePutDir = Rename.beforeEntries[index].putDir
			afterPutDir = renamedEntries[index].putDir

			if beforePutDir != afterPutDir:
				print 'fix ... put directory changed'
				return

		for index in range(len(renamedEntries)):
			before = Rename.beforeEntries[index].fullPathDQ

			if os.name == 'nt':
				after = MyString.surround(renamedEntries[index].entryName, '"')
				vim.command('silent !rename ' + before + ' ' + after)
			else:
				after = renamedEntries[index].fullPathDQ
				vim.command('silent !mv ' + before + ' ' + after)

EOM
