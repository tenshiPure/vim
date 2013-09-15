#-*- coding: utf-8 -*-

import Util

#
# Vimのカレントバッファを表すクラス
#
class Buf:

	#
	# コンストラクタ
	#
	def __init__(self):
		self.name = self._getName()
		self.lines = self._getLines()
		self.len = self._getLineNum()

	#
	# 名前を取得
	#
	def _getName(self):
		if Util.isPython():
			return 'mock'
		else:
			import vim
			return vim.current.buffer.name

	#
	# 行を取得
	#
	def _getLines(self):
		if Util.isPython():
			return ['', 'mock line 1', 'mock line 2', 'mock line 3']
		else:
			import vim
			result = ['']
			for line in vim.current.buffer:
				result.append(line)

			return result

	#
	# 行数を取得
	#
	def _getLineNum(self):
		return len(self.lines) - 1

	#
	# ジェネレータ
	#
	def loop(self, start = None, end = None, lineNum = False):
		if start is None:
			start = 0
		if end is None:
			end = self.len

		for i, line in enumerate(self.lines):
			if i == 0 or not(start <= i <= end):
				continue

			if lineNum:
				yield (i, line)
			else:
				yield line

	#
	# 行を差し替える
	#
	def setLines(self, lines):
		self.lines = ['']
		self.lines.extend(lines)
		if Util.isPython():
			pass
		else:
			import vim
			vim.command(':normal ggdG')
			for line in self.loop():
				vim.command(':normal o%s' % line)
			vim.command(':normal ggdd')

	#
	# 開発補助
	#
	def __str__(self):
		print self.name
		print self.len
		print type(self.lines)
		for i, line in enumerate(self.lines):
			print i, line

		return ''

if __name__ == '__main__':
	buf = Buf()
#	print buf
#	for b in buf.loop():
#		print b

#	for i, b in buf.loop(start = 1, end = 2, lineNum = True):
#		print i, b
#	buf.setLines(['hoge', 'fuga'])
#	for line in buf.lines:
#		print line
