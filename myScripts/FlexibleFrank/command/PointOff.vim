python <<EOM
import vim

class PointOff(CommandBase):

	commandName = 'PointOff'
	doneMessage = commandName + CommandBase.doneMessage
	firstLine = 0
	lastLine = 0

	#
	# 擬似コンストラクタ
	#
	def __init__(self, firstLine, lastLine):
		self.firstLine = firstLine
		self.lastLine = lastLine

	#
	# ポイントをオフにする
	#
	def execute(self, frank):
		frank.pointOff(self.firstLine, self.lastLine)

		print self.doneMessage

EOM
