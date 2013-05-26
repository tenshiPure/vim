python <<EOM

class Fix(CommandBase):

	commandName = 'Fix'

	#
	# 直前のFix待ちコマンドを確定させる
	#
	def execute(self, frank):
		if Prev.fix == None:
			raise NotExecutedBeforeFixCommandException(self.commandName)
		else:
			Prev.fix()

EOM
