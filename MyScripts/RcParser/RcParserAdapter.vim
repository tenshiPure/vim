python <<EOM

import AutoLoader
import Util

from vim_bridge import bridged

#
# vim用アダプタ
#
@bridged
def RcParserAdapter():
	import Parser

	env = Parser.getEnv()

	list = Parser.getList()

	result = Parser.parse(list, env)

	Parser.writeList(result)

EOM
