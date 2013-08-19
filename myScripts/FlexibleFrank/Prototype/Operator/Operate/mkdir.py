#-*- coding: utf-8 -*-
import os
import os.path

class Mkdir:
	
	def execute(self):
		targetPath = os.path.abspath('TestDir/MadeIt')
		os.makedirs(targetPath)

	def unexecute(self):
		pass
