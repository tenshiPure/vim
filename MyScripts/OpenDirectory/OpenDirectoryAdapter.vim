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
def OpenDirectoryAdapter(path):
	Util.sysPathAppendUnderMyScriptsPath('OpenDirectory')
	from Opener import Opener

	opener = Opener(path)
	opener.execute()

EOM
