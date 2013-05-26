python <<EOM

class CommandFactory:

	#
	# ƒRƒ}ƒ“ƒh‚ð¶¬‚·‚é
	#
	def create(self, command):
		if command == 'edit':
			command = Edit()

		elif command == 'openDir':
			command = OpenDir()

		elif command == 'openByApp':
			command = OpenByApp()

		elif command == 'cd':
			command = ChangeDir()

		elif command == 'cdUpper':
			command = ChangeDirUpper()

		elif command == 'cdLast':
			command = ChangeDirLast()

		elif command == 'copy':
			command = Copy()

		elif command == 'move':
			command = Move()

		elif command == 'delete':
			command = Delete()

		elif command == 'mkdir':
			command = Mkdir()

		elif command == 'renameBuf':
			command = Rename()

		return command
EOM
