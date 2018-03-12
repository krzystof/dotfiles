setlocal foldmethod=expr
setlocal foldexpr=VueComponentFolds()

function! VueComponentFolds()
  let thisline = getline(v:lnum)

  if thisline =~ '\v^\s*$'
    if getline(v:lnum + 1) !=~ '\v^<[template|script|style]'
      return "0"
    endif
  endif

  return "1"
endfunction
