#-*- coding: utf-8 -*-
import os
import os.path

#
# ディレクトリの作成を行う
#
class Mkdir:
	
	#
	# String   rootDir    : 作成するディレクトリの親となるルートディレクトリ
	# [String] targetDirs : 作成するディレクトリ名
	#
	# note
	# 	os.sep区切りで文字列を渡せば再帰的に作成する
	# 	存在するディレクトリは作成をスキップされる
	#
	def __init__(self, rootDir, targetDirs):
		self.rootDir = rootDir
		self.targetDirs = targetDirs
		self.originDirs = []

	#
	# 実行
	#
	def execute(self):
		self.originDirs = []
		self.getOriginDirs(self.rootDir)

		for targetDir in self.targetDirs:
			os.makedirs(os.path.join(self.rootDir, targetDir))

	#
	# 実行取り消し
	#
	def unexecute(self):
		self.removeDirs(self.rootDir)

	#
	# ルートに元々あったディレクトリを取得
	#
	def getOriginDirs(self, currentRoot):
		for entryName in os.listdir(currentRoot):
			fullPath = os.path.join(currentRoot, entryName)
			self.originDirs.append(fullPath)

			if os.path.isdir(fullPath):
				self.getOriginDirs(fullPath)

	#
	# ルートに元々あったディレクトリ以外を削除
	#
	def removeDirs(self, currentRoot):
		for entryName in os.listdir(currentRoot):
			fullPath = os.path.join(currentRoot, entryName)

			if os.path.isdir(fullPath):
				self.removeDirs(fullPath)

			if fullPath not in self.originDirs:
				os.rmdir(fullPath)
