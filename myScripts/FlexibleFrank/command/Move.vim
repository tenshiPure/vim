python <<EOM
import vim

class Move(CommandBase):

	#
	# 対象を移動する
	#
	def execute(self, frank):
		toEntry = CommandBase.getUnderCursorEntry(self, frank)
		if not(toEntry.isDir):
			raise DestinationNotDirException('Move')

		targetEntries = CommandBase.getTargetEntries(self, frank)

		if len(targetEntries) == 0:
			raise NotPoiontedException('Move')

		for targetEntry in targetEntries:
			if os.name == 'nt':
				vim.command('silent !move "' + targetEntry.fullPath + '" "' + toEntry.fullPath + '"')
			else:
				vim.command('silent !mv "' + targetEntry.fullPath + '" "' + toEntry.fullPath + '"')

EOM
