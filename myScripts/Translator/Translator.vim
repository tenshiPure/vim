python <<EOM
# -*- coding: utf-8 -*-

class Translator:

	#
	# 翻訳実行
	#
	def execute(self):
		token = self.getAccessToken()
		translateApiResult = self.translate(token)
		result = self.parseXml(translateApiResult)
		self.outputResult(result)

	#
	# アクセストークンを取得するAPIをたたく
	#
	def getAccessToken(self):
		params = urllib.urlencode(GetAccessTokenVal.POST_PARAMS)
		request = urllib2.Request(GetAccessTokenVal.URL, params)
		response = urllib2.urlopen(request)
		jsonData = json.loads(response.read())

		return jsonData['access_token']

	#
	# 翻訳するAPIをたたく
	#
	def translate(self, token):
		url = self.addGetParams(TranslateVal.URL)
		request = urllib2.Request(url)
		request.add_header('Authorization', 'Bearer %s' % (token))
		response = urllib2.urlopen(request)

		return response.read()

	#
	# GETパラメータを追加する
	#
	def addGetParams(self, url):
		buf = _Buffer()

		if buf.name == ja_trs:
			_from = 'ja'
			_to = 'en'
		else:
			_from = 'en'
			_to = 'ja'

		text = buf.currentCorsurLine

		return url + '?from=%s&to=%s&text=%s' % (_from, _to, text)

	#
	# API返却値から結果を抜き出す
	#
	def parseXml(self, string):
		return re.sub(r'<[^>]*>', '', string)
		
	#
	# 結果を出力する
	#
	def outputResult(self, result):
		buf = _Buffer()

		if buf.name == ja_trs:
			Tab.switchTab(en_trs, 2)
		else:
			Tab.switchTab(ja_trs, 2)

		buf.write(1, result)

		Tab.switchTab(buf.name, 2)

EOM
