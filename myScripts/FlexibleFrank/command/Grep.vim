python <<EOM
import vim
import os
import re

class Grep(CommandBase):

	commandName = 'Grep'

	#
	# ディレクトリを開く
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

#		vim.command('silent r%(grep)s %(option)s %(word)s %(targetPath)s' % locals())

#		results = CommandBase.getEntryNamesFromFrank3(self)

#		vim.current.buffer[:] = None
#		for e in results:
#			vim.current.buffer.append(re.sub('\d\d:\t*', ':', e))
#			vim.current.buffer.append(e)

#		grepCommand = '%(grep)s %(option)s %(word)s \"%(targetPath)s\"' % locals()

#		vim.command('let var = ""')
#		vim.command('redir! => var')
#		vim.command('execute "' + grepCommand + '"')
#		vim.command('redir END')
#		var = vim.eval('var')

#		print var

		vim.command('call Hoge()')


EOM

function! Hoge()
	redir! => var
"	execute '!C:/cygwin/bin/grep -inr execute ' + 'C:/Program Files (x86)/vim/gitvim/myScripts/FlexibleFrank'
	execute '!C:/cygwin/bin/grep -inr execute .'
	redir END

	echo 'var...'
	echo var
endfunction

"正解
"!C:/cygwin/bin/grep -inr execute "C:/Program Files (x86)/vim/gitvim/myScripts/FlexibleFrank"
