python <<EOM
# -*- coding: utf-8 -*-

class Translator:

	#
	# コンストラクタ
	#
	def __init__(self):
		token = self.getAccessToken()
		translateApiResult = self.translate(token)
		result = self.parseXml(translateApiResult)

		print result

	#
	# アクセストークンを取得する
	#
	def getAccessToken(self):
		params = urllib.urlencode(GetAccessTokenVal.POST_PARAMS)
		request = urllib2.Request(GetAccessTokenVal.URL, params)
		response = urllib2.urlopen(request)
		jsonData = json.loads(response.read())

		return jsonData['access_token']

	#
	# 翻訳する
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
		return url + '?from=ja&to=en&text=早寝早起き'

	#
	# API返却値から結果を抜き出す
	#
	def parseXml(self, string):
		return re.sub(r'<[^>]*>', '', string)
		
EOM
