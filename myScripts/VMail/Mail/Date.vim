python <<EOM
# -*- coding:utf-8 -*-

class Date:

	#
	# コンストラクタ
	#
	def __init__(self, originData):
		try:
			parsed = email.utils.parsedate_tz(originData)

			_year   = parsed[0]
			_month  = parsed[1]
			_day    = parsed[2]
			_hour   = parsed[3]
			_minute = parsed[4]
			_second = parsed[5]
			gmt = datetime.datetime(_year, _month, _day, _hour, _minute, _second)

			jst = datetime.timedelta(seconds = 32400)
			_offset = jst - datetime.timedelta(seconds = parsed[9])

			_d = (gmt + _offset)

			weeks = {'0' : u'日', '1' : u'月', '2' : u'火', '3' : u'水', '4' : u'木', '5' : u'金', '6' : u'土'}
			_week = String.convert(weeks[_d.strftime('%w')], None, 'vim')

			self.date     = _d.strftime('%m/%d')
			self.time     = _d.strftime('%H:%M')
			self.datetime = '%s(%s) %s' % (_d.strftime('%Y/%m/%d'), _week, _d.strftime('%H:%M:%S'))
			self.forIndex = self.date + ' ' + self.time

		except:
			self.date           = Mail.ANALYSIS_FAILURE
			self.time           = Mail.ANALYSIS_FAILURE
			self.datetime       = Mail.ANALYSIS_FAILURE
			self.lenAdjusted    = Mail.ANALYSIS_FAILURE

	#
	# ダンプ
	#
	def dump(self):
		print '-date-'
		print self.date
		print self.time
		print self.datetime
		print ' '

EOM
