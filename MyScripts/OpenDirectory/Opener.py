#-*- coding: utf-8 -*-

import os
import os.path

import Util

class Opener:

	#
	# コンストラクタ
	#
	def __init__(self, path):
		self.dirPath = self.adjustPath(path)

	#
	# パスを調整
	#
	def adjustPath(self, path):
		if os.path.isfile(path):
			return os.path.abspath(os.path.dirname(path))

		elif os.path.isdir(path):
			return os.path.abspath(path)

	#
	# 実行
	#
	def execute(self):
		if Util.isWin():
			if Util.isVim():
				import vim
				vim.command(r'silent !explorer "%s"' % (self.dirPath))
			if Util.isPython():
				os.system('explorer "%s"' % (self.dirPath))

		if Util.isMac():
			if Util.isVim():
				import vim
				vim.command(r'silent !open "%s"' % self.dirPath)
			if Util.isPython():
				os.system('open "%s"' % self.dirPath)
