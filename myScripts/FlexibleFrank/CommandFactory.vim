python <<EOM

class CommandFactory:

	#
	# コマンドを生成する
	#
	def create(self, command, firstLine, lastLine):
		if command == 'Fix':
			command = Fix()

		elif command == 'ChangeDir':
			command = ChangeDir()

		elif command == 'ChangeDirUpper':
			command = ChangeDirUpper()

		elif command == 'ChangeDirLast':
			command = ChangeDirLast()

		elif command == 'OpenDir':
			command = OpenDir()

		elif command == 'OpenByApp':
			command = OpenByApp()

		elif command == 'Reed':
			command = Reed()

		elif command == 'Mkdir':
			command = Mkdir()

		elif command == 'PointOn':
			command = PointOn(firstLine, lastLine)

		elif command == 'PointOff':
			command = PointOff(firstLine, lastLine)

		elif command == 'Edit':
			command = Edit(firstLine, lastLine)

		elif command == 'Copy':
			command = Copy(firstLine, lastLine)

		elif command == 'Move':
			command = Move(firstLine, lastLine)

		elif command == 'Delete':
			command = Delete(firstLine, lastLine)

		elif command == 'Rename':
			command = Rename(firstLine, lastLine)

		return command
EOM
