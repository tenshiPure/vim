python <<EOM

import sys
import vim

sys.path.append(vim.eval('$MyScripts'))
import Util

from vim_bridge import bridged

#
# vim用アダプタ
#
@bridged
def RcParserAdapter():
	Util.sysPathAppendUnderMyScriptsPath('RcParser')
	import Parser

	env = Parser.getEnv()

	list = Parser.getList()

	result = Parser.parse(list, env)

	Parser.writeList(result)

EOM
