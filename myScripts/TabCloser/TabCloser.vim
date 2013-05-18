python <<EOM
import vim
import os

class TabCloser:

	targetBufName = ''
	forceList = {}

	#
	# 擬似コンストラクタ
	#
	def __init__(self):
		self.targetBufName = vim.current.buffer.name
		self.makeForceList()

	#
	# 強制閉じる対象の辞書を作成する
	#
	def makeForceList(self):
		head = vim.eval('$myScripts')

		self.forceList['FlexibleFrank_Frank1'] = os.path.abspath(head + '/FlexibleFrank2/WorkingTexts/Frank1.frank2')
		self.forceList['FlexibleFrank_Frank2'] = os.path.abspath(head + '/FlexibleFrank2/WorkingTexts/Frank2.frank2')
		self.forceList['FlexibleFrank_Rename'] = os.path.abspath(head + '/FlexibleFrank2/WorkingTexts/Rename.frank2')
		self.forceList['GitAssist_CommandList'] = os.path.abspath(head + '/GitAssist/CommandList.gass')
		self.forceList['GitAssist_CommandResult'] = os.path.abspath(head + '/GitAssist/CommandResult.gass')

	#
	# コントローラから呼ばれるメソッド
	#
	def execute(self):
		self.close()
		self.secondClose()

	#
	# 強制的に閉じるタブか判定
	#
	def isForce(self):
		for force in self.forceList.itervalues():
			if self.targetBufName == force:
				return True

		return False
		
	#
	# タブを閉じる
	#
	def close(self):
		if self.isForce():
			vim.command('execute "bdelete!"')
		else:
			vim.command('execute "bdelete"')
	
	#
	# 強制対象は２度閉じ対象
	#
	def secondClose(self):
		currentTargetBufName = vim.current.buffer.name

		for second in self.forceList.itervalues():
			if currentTargetBufName == second:
				vim.command('execute "bdelete!"')

EOM
