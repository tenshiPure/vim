python <<EOM

import AutoLoader
import Util

from vim_bridge import bridged

#
# vim用アダプタ
#
@bridged
def OpenDirectoryAdapter(path):
	from Opener import Opener

	opener = Opener(path)
	opener.execute()

EOM
