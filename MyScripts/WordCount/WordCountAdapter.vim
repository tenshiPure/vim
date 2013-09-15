python <<EOM

import AutoLoader
import Util

from vim_bridge import bridged

#
# vim用アダプタ
#
@bridged
def WordCountAdapter(args):
	from Counter import Counter 

	counter = Counter(args)
	counter.execute()

EOM
