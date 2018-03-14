setlocal foldmethod=expr
setlocal foldexpr=JsFolds(v:lnum)
setlocal foldtext=NeatFoldText()

function! JsFolds(lnum)
  let thisline = getline(a:lnum)

  if thisline =~ '\v\{$'
    return IndentLevel(a:lnum) + 1
  endif

  if LineIsEndOfFold(a:lnum)
    return IndentLevel(a:lnum) + 1
  endif

  if thisline =~ '\v^\s*$' && LineIsEndOfFold(a:lnum - 1)
    return IndentLevel(a:lnum - 1)
  endif

  return "-1"
endfunction

function! IndentLevel(lnum)
  return indent(a:lnum) / &shiftwidth
endfunction

function! LineIsEndOfFold(lnum)
  return getline(a:lnum) =~ '\v^\s*\}'
endfunction
