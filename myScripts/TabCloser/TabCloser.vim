python <<EOM
import vim
import os

class TabCloser:

	targetBufNum  = 0
	targetBufName = ''
	forceList = {}

	#
	# 擬似コンストラクタ
	#
	def __init__(self):
		self.targetBufNum  = int(vim.eval('tabpagenr()'))
		self.targetBufName = vim.current.buffer.name
		self.makeForceList()

	#
	# 強制閉じる対象の辞書を作成する
	#
	def makeForceList(self):
		head = vim.eval('$myScripts')

		self.forceList['FlexibleFrank_frank1'] = os.path.abspath(head + '/FlexibleFrank/WorkingText.frank')
		self.forceList['FlexibleFrank_frank2'] = os.path.abspath(head + '/FlexibleFrank/MoreWorkingText.frank')
		self.forceList['GitAssist_CommandList'] = os.path.abspath(head + '/GitAssist/CommandList.txt')
		self.forceList['GitAssist_CommandResult'] = os.path.abspath(head + '/GitAssist/CommandResult.txt')

	#
	# コントローラから呼ばれるメソッド
	#
	def execute(self):
		self.close()
		self.secondClose()
#		self.moveLeftTab()

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

	#
	# 左のタブへ移る
	#
#	def moveLeftTab(self):
#		myScripts = vim.eval('$myScripts')
#		frank1 = myScripts + os.sep + 'FlexibleFrank' + os.sep + 'WorkingText.frank'
#		frank2 = myScripts + os.sep + 'FlexibleFrank' + os.sep + 'MoreWorkingText.frank'

#		if vim.current.buffer.name == frank1:
#			self.close()
#		elif vim.current.buffer.name == frank2:
#			self.close()

#		if int(vim.eval('tabpagenr()')) != self.targetBufNum - 1:
#			vim.command('execute ":normal gT"')
EOM
