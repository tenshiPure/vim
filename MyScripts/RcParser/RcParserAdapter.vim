python <<EOM

#
# vim用アダプタ
#
@bridged
def RcParserAdapter():
	sysPathAppendUnderMyScriptsPath('RcParser')
	import Parser

	env = Parser.getEnv()

	list = Parser.getList()

	result = Parser.parse(list, env)

	Parser.writeList(result)

EOM
