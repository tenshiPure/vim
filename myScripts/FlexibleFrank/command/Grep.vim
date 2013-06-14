python <<EOM
import vim
import os

class Grep(CommandBase):

	commandName = 'Grep'
	grepResultObjects = {}

	#
	# Grepを実行する
	#
	def execute(self, frank):
		if vim.current.buffer.name != pathFrank1:
			raise NotExecutedFrankNException(self.commandName, 1)

		if os.name == 'nt':
			grep = '!C:/cygwin/bin/grep'
		else:
			grep = '!grep'

		word = CommandBase.getLinesFromFrank3(self)[0]

		MyTab.switchTab(pathFrank1, 3)
		targetEntry = CommandBase.getUnderCursorEntry(self, frank)

		if not(targetEntry.isDir):
			raise DestinationNotDirException(self.commandName)

		targetDir = targetEntry.fullPath

		command = 'execute "silent %(grep)s -inr %(word)s %(targetDir)s"' % locals()
		result = self.getGrepResult(command)

		self.grepResultObjects = self.makeGrepResultObjects(result)


	#
	# vim変数にgrepのコマンド結果をリダイレクトし、python変数として取得する
	#
	def getGrepResult(self, command):
		vim.command('redir! => result')
		vim.command(command)
		vim.command('redir END')

		return vim.eval('result')
	
	#
	# 文字列型のgrep結果を改行パースし、各行をGrepResultオブジェクトとして辞書化する
	#
	def makeGrepResultObjects(self, result):
		rows = result.split('\n')
		rows.pop(0)
		rows.pop(0)
		rows.pop(-1)

		rtnDict = {}
		for index, row in enumerate(rows):
			rtnDict[index] = GrepResultEntry(row)

		return rtnDict

EOM
