source $myScripts/FlexibleFrank/command/GrepResult.vim

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
		if vim.current.buffer.name != pathFrank3:
			raise NotExecutedFrankNException(self.commandName, 3)

		if os.name == 'nt':
			grep = '!C:/cygwin/bin/grep'
		else:
			grep = '!grep'
		option = '-inr'
		word = 'execute'
		targetPath = 'C:/Program Files (x86)/vim/gitvim/myScripts/FlexibleFrank'
		targetPath = '/Users/ryo/Documents/gitvim/myScripts/FlexibleFrank/'

		command = 'execute "silent %(grep)s %(option)s %(word)s %(targetPath)s"' % locals()

		result = self.getGrepResult(command)

		self.grepResultObjects = self.makeGrepResultObjects(result)

		for i in range(len(self.grepResultObjects)):
			print self.grepResultObjects[i].fullPath
			print self.grepResultObjects[i].putDir
			print self.grepResultObjects[i].entryName
			print self.grepResultObjects[i].lineNum
			print self.grepResultObjects[i].match
			print '-----' * 30


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
			rtnDict[index] = GrepResult(row)

		return rtnDict

EOM
