python <<EOM
# -*- coding: utf-8 -*-

import urllib
import urllib2
import json
import re

class Translator:

	#
	# コンストラクタ
	#
	def __init__(self, _from, _to, _text):
		self._from = _from
		self._to = _to
		self._text = _text

	#
	# 翻訳実行
	#
	def execute(self):
		token = self.getAccessToken()
		translateApiResult = self.translate(token)
		result = self.parseXml(translateApiResult)

		return result

	#
	# アクセストークンを取得するAPIをたたく
	#
	def getAccessToken(self):
		params = urllib.urlencode(Const.TOKEN_PARAMS)
		request = urllib2.Request(Const.TOKEN_URL, params)
		response = urllib2.urlopen(request)
		jsonData = json.loads(response.read())

		return jsonData['access_token']

	#
	# 翻訳するAPIをたたく
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
