python <<EOM
# -*- coding: utf-8 -*-

import re

class Surround:

	#
	# コンストラクタ
	#
	def __init__(self, lineNum, target, word, surrounder):
		self.lineNum = lineNum
		self.target = target
		self.word = word if word != 'None' else ''
		self.surrounderHead, self.surrounderTail = self.getSurrounder(surrounder)

	#
	# 実行
	#
	def execute(self):
		line = String.getLineFromCurrentBuffer()
		after = '%s%s%s%s' % (self.word, self.surrounderHead, self.target, self.surrounderTail)

		resultLine = line.replace(self.target, after)

		_Buffer().write(self.lineNum, resultLine)

	#
	# 囲む文字を取得する
	#
	def getSurrounder(self, surrounder):
		if surrounder in ['(', ')']:
			return ('(', ')')

		elif surrounder in ['<', '>']:
			return ('<', '>')

		elif surrounder in ['[', ']']:
			return ('[', ']')

		elif surrounder in ['{', '}']:
			return ('{', '}')

#		elif surrounder in ['((', '))']:
#			return (u'（', u'）')

#		elif surrounder in ['<<', '>>']:
#			return (u'＜', u'＞')

#		elif surrounder in ['[[', ']]']:
#			return (u'「', u'」')

#		elif surrounder in ['{{', '}}']:
#			return (u'【', u'】')

		else:
			return (surrounder, surrounder)

EOM
