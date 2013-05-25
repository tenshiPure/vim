python <<EOM

class CommandFactory:

	#
	# ƒRƒ}ƒ“ƒh‚ð¶¬‚·‚é
	#
	def create(self, command):
		if command == 'edit':
			command = Edit('Edit')

		elif command == 'openDir':
			command = OpenDir('OpenDir')

		elif command == 'openByApp':
			command = OpenByApp('OpenByApp')

		elif command == 'cd':
			command = ChangeDir('ChangeDir')

		elif command == 'cdUpper':
			command = ChangeDirUpper('ChangeDirUpper')

		elif command == 'cdLast':
			command = ChangeDirLast('ChangeDirLast')

		elif command == 'copy':
			command = Copy('Copy')

		elif command == 'move':
			command = Move('Move')

		elif command == 'delete':
			command = Delete('Delete')

		elif command == 'mkdir':
			command = Mkdir('Mkdir')

		return command
EOM
