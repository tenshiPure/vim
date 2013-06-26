python <<EOM
import vim
import os

class TabCloser:

	commandName = 'TabClose'

	#
	# 擬似コンストラクタ
	#
	def __init__(self):
		self.targetBufName = vim.current.buffer.name
		self.forceGroup = self.makeForceList()

	#
	# 強制閉じる対象の辞書を作成する
	#
	def makeForceList(self):
		head = vim.eval('$myScripts')

		result = {
			'FlexibleFrank' : 
			{
				'frank1' : os.path.abspath(head + '/FlexibleFrank/WorkingTexts/Frank1.frank'),
				'frank2' : os.path.abspath(head + '/FlexibleFrank/WorkingTexts/Frank2.frank'),
				'frank3' : os.path.abspath(head + '/FlexibleFrank/WorkingTexts/Frank3.frank'),
			},
			'CommandAssistant' : 
			{
				'CommandList' : os.path.abspath(head + '/CommandAssistant/CassFiles/CommandList.cass'),
				'CommandResult' : os.path.abspath(head + '/CommandAssistant/CassFiles/CommandResult.cass'),
			},
			'CommandAssistantHistory' : 
			{
				'CommandListHistory' : os.path.abspath(head + '/CommandAssistant/CassFiles/CommandListHistory.cass'),
				'CommandResultHistory' : os.path.abspath(head + '/CommandAssistant/CassFiles/CommandResultHistory.cass'),
			},
			'MySQLAssistant' : 
			{
				'DescResult' : os.path.abspath(head + '/MySQLAssist/WorkingTexts/DescResult.mass'),
				'SelectResult' : os.path.abspath(head + '/MySQLAssist/WorkingTexts/SelectResult.mass'),
				'ShowResult' : os.path.abspath(head + '/MySQLAssist/WorkingTexts/ShowResult.mass'),
			},
		}

		return result

	#
	# コントローラから呼ばれるメソッド
	#
	def execute(self):
		groupName = self.isIncludedForceGroup()

		if groupName is None:
			self.close()
		else:
			self.groupClose(groupName)

	#
	# 強制グループに現バッファが含まれるかを判定する
	#
	def isIncludedForceGroup(self):
		for groupName, groupElements in self.forceGroup.items():
			for elementName, elementValue in groupElements.items():
				if elementValue == vim.current.buffer.name:
					return groupName
		return None

	#
	# タブを閉じる
	#
	def close(self):
		vim.command('execute "bdelete"')
	
	#
	# グループを閉じる
	#
	def groupClose(self, groupName):
		for elementName, elementValue in self.forceGroup[groupName].items():
			vim.command('bdelete! ' + MyString.escapeSpace(elementValue))
		
EOM
