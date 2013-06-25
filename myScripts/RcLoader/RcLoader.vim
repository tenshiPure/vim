"RcLoader.vim

function! RcLoader()

python <<EOM

nonReplaceFileName = '/Users/ryo/Documents/gitvim/rc/vimrc_non_replace.vim'
replacedFileName = '/Users/ryo/Documents/tmp/replaced.txt'

if vim.eval('$isOnceCompleted') == 'yes':
isOnceCompleted = 'yes'
else:
isOnceCompleted = 'no'

nonReplacedLines = []
file = open(nonReplaceFileName, 'r')
for line in file:
nonReplacedLines.append(line)
file.close()

replacedLines = []

index = 0
while index < len(nonReplacedLines):
line = nonReplacedLines[index]

if line.find('--win') != -1:
replacedLines.append('if os == win\n')
replacedLines.append(line.replace('--win', ''))
replacedLines.append('endif\n')

elif line.find('--mac') != -1:
replacedLines.append('if os == mac\n')
replacedLines.append(line.replace('--mac', ''))
replacedLines.append('endif\n')

elif line.find('--first time only') != -1 and isOnceCompleted == 'no':
replacedLines.append(line.replace('--first time only', ''))
elif line.find('--first time only') != -1 and isOnceCompleted == 'yes':
pass

else:
replacedLines.append(line)

index = index + 1

del replacedLines[0]

file = open(replacedFileName, 'w')
file.writelines(replacedLines)
file.close()

EOM

endfunction
