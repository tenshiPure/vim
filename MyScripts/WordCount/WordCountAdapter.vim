python <<EOM

#
# vim用アダプタ
#
@bridged
def WordCountAdapter(args):
	sysPathAppendUnderMyScriptsPath('../MyFundamental')

	sysPathAppendUnderMyScriptsPath('WordCount')
	from Counter import Counter 

	counter = Counter(args)
	counter.execute()

EOM
