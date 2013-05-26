python <<EOM
import vim

class PointOn(CommandBase):

	commandName = 'PointOn'
	firstLine = 0
	lastLine = 0

	#
	# 擬似コンストラクタ
	#
	def __init__(self, firstLine, lastLine):
		self.firstLine = firstLine
		self.lastLine = lastLine

	#
	# ポイントをオンにする
	#
	def execute(self, frank):
		frank.pointOn(self.firstLine, self.lastLine)

EOM
