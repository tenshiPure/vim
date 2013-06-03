python <<EOM
import vim
import os
import re

class Grep(CommandBase):

	commandName = 'Grep'

	#
	# Grep〜〜
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

		vim.command('redir! => result')
		vim.command('execute "silent !grep -inr execute /Users/ryo/Documents/gitvim/myScripts/FlexibleFrank/"')
		vim.command('redir END')
		res = vim.eval('result')
#		vim.command('let result = RedirGrepResult()')
#		res = vim.eval('result')

		print res


EOM

function! RedirGrepResult()
	redir! => result
	execute 'silent !grep -inr execute /Users/ryo/Documents/gitvim/myScripts/FlexibleFrank/'
	redir END

	return result
endfunction

"正解
"!C:/cygwin/bin/grep -inr execute "C:/Program Files (x86)/vim/gitvim/myScripts/FlexibleFrank"
