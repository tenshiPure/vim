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

		if os.name == 'nt':
			text = self.convertCharCode(buf.currentCorsurLine, 'cp932', 'utf-8')
		else:
			text = self.convertCharCode(buf.currentCorsurLine, 'cp932', 'utf-8')
		text = self.replaceSpace(text)

		return url + '?from=%s&to=%s&text=%s' % (_from, _to, text)
	
	#
	# 文字コード変換
	#
	def convertCharCode(self, string, _from, _to):
		return string.decode(_from).encode(_to)

	#
	# 半角スペースを半角＋に置き換える
	#
	def replaceSpace(self, string):
		return re.sub(r' ', r'+', string)

	#
	# API返却値から結果を抜き出す
	#
	def parseXml(self, string):
		return re.sub(r'<[^>]*>', '', string)
		
	#
	# 結果を出力する
	#
	def outputResult(self, text):
		buf = _Buffer()

		if buf.name == ja_trs:
			Tab.switchTab(en_trs, 2)
		else:
			Tab.switchTab(ja_trs, 2)

		if os.name == 'nt':
			text = self.convertCharCode(text, 'utf-8', 'cp932')
		else:
			text = self.convertCharCode(text, 'utf-8', 'cp932')
			
		buf.write(1, text)

		Tab.switchTab(buf.name, 2)

EOM
