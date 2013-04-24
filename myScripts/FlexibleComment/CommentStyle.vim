python <<EOM

class CommentStyle:
	
	def getTop(commentStyle):
		if commentStyle == 'java':
			return '//'

		if commentStyle == 'php':
			return '//'

		if commentStyle == 'js':
			return '//'

		if commentStyle == 'css':
			return '//'

		if commentStyle == 'ahk':
			return ';'

		if commentStyle == 'vim':
			return '"'

		if commentStyle == 'py':
			return '#'

		if commentStyle == 'sh':
			return '#'

		if commentStyle == 'html':
			return '<!--'

		if commentStyle == 'tpl':
			return '<!--'

	def getTail(commentStyle):
		if commentStyle == 'java':
			return ''

		if commentStyle == 'php':
			return ''

		if commentStyle == 'js':
			return ''

		if commentStyle == 'css':
			return ''

		if commentStyle == 'ahk':
			return ''

		if commentStyle == 'vim':
			return ''

		if commentStyle == 'py':
			return ''

		if commentStyle == 'sh':
			return ''

		if commentStyle == 'html':
			return '-->'

		if commentStyle == 'tpl':
			return '-->'

	getTop = staticmethod(getTop)
	getTail = staticmethod(getTail)
EOM
