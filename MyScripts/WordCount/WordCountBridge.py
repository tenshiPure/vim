python <<EOM

@bridged
def WordCountBridge(args):
	#複数箇所でsys.path.appendしたくない。出来ればbaseへ。
	import sys
	sys.path.append(os.path.join(PATH_MY_SCRIPTS, 'WordCount'))
	sys.path = list(set(sys.path))

	import WordCount

	for arg in args:
		print arg

EOM
