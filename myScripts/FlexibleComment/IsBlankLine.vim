"FlexibleComment

"IsBlankLine.vim
"空行判定

function! IsBlankLine(current_line)

	"注目行にタブとスペース以外が含まれているかを判定
	let result = match(a:current_line, "[^\t ]")

	return result

endfunction

