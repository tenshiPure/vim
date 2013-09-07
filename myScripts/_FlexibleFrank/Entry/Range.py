# -*- coding:utf-8 -*-
import re

class Range:

	#
	# コンストラクタ
	#
	def __init__(self, entry, start, end):
		if re.search(r'(^[0-9]+$|^[\^\.]$)', start):
			if start == '^':
				self.start = int(entry.id)
			else:
				self.start = int(start)
		
		if re.search(r'(^[0-9]+$|^[\$\.]$)', end):
			if end == '$':
				for e in entry.loop():
					self.end = int(e.id)
			else:
				self.end = int(end)

	#
	# rangeリストを作成
	#
	def createList(self):
		return range(self.start, self.end + 1)
