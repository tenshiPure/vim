python <<EOM

class CommentStyle:
	
	def getTop(comment_style):
		if comment_style == 'java':
			return '//'

		if comment_style == 'php':
			return '//'

		if comment_style == 'js':
			return '//'

		if comment_style == 'css':
			return '//'

		if comment_style == 'ahk':
			return ';'

		if comment_style == 'vim':
			return '"'

		if comment_style == 'py':
			return '#'

		if comment_style == 'sh':
			return '#'

		if comment_style == 'html':
			return '<!--'

		if comment_style == 'tpl':
			return '<!--'

	def getTail(comment_style):
		if comment_style == 'java':
			return ''

		if comment_style == 'php':
			return ''

		if comment_style == 'js':
			return ''

		if comment_style == 'css':
			return ''

		if comment_style == 'ahk':
			return ''

		if comment_style == 'vim':
			return ''

		if comment_style == 'py':
			return ''

		if comment_style == 'sh':
			return ''

		if comment_style == 'html':
			return '-->'

		if comment_style == 'tpl':
			return '-->'

	getTop = staticmethod(getTop)
	getTail = staticmethod(getTail)
EOM
