python <<EOM

class CommandFactory:

	#
	# コマンドを生成する
	#
	def create(self, command, firstLine, lastLine):
		if command == 'Switch':
			command = GetModeSwitch()

		elif command == 'Fix':
			command = Fix()

		elif command == 'Grep':
			command = Grep()

		elif command == 'ChangeDir':
			command = ChangeDir()

		elif command == 'ChangeDirUpper':
			command = ChangeDirUpper()

		elif command == 'ChangeDirBefore':
			command = ChangeDirBefore()

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

		elif command == 'Remove':
			command = Remove(firstLine, lastLine)

		elif command == 'Rename':
			command = Rename(firstLine, lastLine)

		elif command == 'QuickLook':
			command = QuickLook()

		return command
EOM
