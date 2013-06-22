python <<EOM
import vim

class Surrounder:

	#
	# コンストラクタ
	#
	def __init__(self, surroundString):
		self.targetWord = vim.eval("expand('<cword>')")
		self.createSurroundStrings(surroundString)
		self.surroundedWord = self.createSurroundedWord()

	#
	# 囲む単語を作る
	#
	def createSurroundStrings(self, surroundString):
		if surroundString == '(' or surroundString == ')':
			self.headSurroundString = '('
			self.footSurroundString = ')'

		elif surroundString == '{' or surroundString == '}':
			self.headSurroundString = '{'
			self.footSurroundString = '}'

		elif surroundString == '[' or surroundString == ']':
			self.headSurroundString = '['
			self.footSurroundString = ']'

		elif surroundString == '<' or surroundString == '>':
			self.headSurroundString = '<'
			self.footSurroundString = '>'

		elif surroundString == '((' or surroundString == '))':
			self.headSurroundString = '（'
			self.footSurroundString = '）'

		elif surroundString == '{{' or surroundString == '}}':
			self.headSurroundString = '【'
			self.footSurroundString = '】'

		elif surroundString == '[[' or surroundString == ']]':
			self.headSurroundString = '「'
			self.footSurroundString = '」'

		elif surroundString == '<' or surroundString == '>':
			self.headSurroundString = '<'
			self.footSurroundString = '>'

		else:
			self.headSurroundString = surroundString
			self.footSurroundString = surroundString

	#
	# 単語を囲む
	#
	def createSurroundedWord(self):
		return self.headSurroundString + self.targetWord + self.footSurroundString

EOM
