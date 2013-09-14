python <<EOM

import os
import sys

import vim
sys.path.append(vim.eval('$MyScripts'))
import Util

from vim_bridge import bridged

#
# vim用アダプタ
#
@bridged
def WordCountAdapter(args):
	Util.sysPathAppendUnderMyScriptsPath('../MyFundamental')

	Util.sysPathAppendUnderMyScriptsPath('WordCount')
	from Counter import Counter 

	counter = Counter(args)
	counter.execute()

EOM
