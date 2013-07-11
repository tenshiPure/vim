python <<EOM
# -*- coding: utf-8 -*-

import urllib
import urllib2
import json
import re

class Translator:

	LocalToken = vim.eval('$myScripts') + '/Translator/LocalToken'

	#
	# コンストラクタ
	#
	def __init__(self, _from, _to, _text):
		self._from = _from
		self._to = _to
		self._text = re.sub(r' ', r'+', _text)

	#
	# 実行
	#
	def execute(self):
		try:
			token = self.getLocalToken()
			translateApiResult = self.translate(token)
		except:
			token = self.getToken()
			translateApiResult = self.translate(token)

		result = self.parseXml(translateApiResult)

		return result

	#
	# ローカルのトークンを取得する
	#
	def getLocalToken(self):
		_file = open(Translator.LocalToken, 'r')

		return _file.readline()

	#
	# ローカルにトークンを保存する
	#
	def setLocalToken(self, token):
		_file = open(Translator.LocalToken, 'w')

		_file.write(token)
		_file.close()

	#
	# トークンを取得する
	#
	def getToken(self):
		params = urllib.urlencode(Const.TOKEN_PARAMS)
		request = urllib2.Request(Const.TOKEN_URL, params)
		response = urllib2.urlopen(request)
		jsonData = json.loads(response.read())

		token = jsonData['access_token']

		self.setLocalToken(token)
		return token

	#
	# 翻訳する
	#
	def translate(self, token):
		url = Const.TRANS_URL + '?from=%s&to=%s&text=%s' % (self._from, self._to, self._text)
		request = urllib2.Request(url)
		request.add_header('Authorization', 'Bearer %s' % (token))
		response = urllib2.urlopen(request)

		return response.read()

	#
	# API返却値から結果を抜き出す
	#
	def parseXml(self, string):
		return re.sub(r'<[^>]*>', '', string)
		
EOM
