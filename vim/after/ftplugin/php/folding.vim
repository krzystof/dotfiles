" http://vimcasts.org/episodes/writing-a-custom-fold-expression/
" Return 0 for no folds
" Returns >1 to start a level 1 fold
" Returns = to say same level fold

setlocal foldmethod=expr
setlocal foldexpr=PhpClassFolds()

function! PhpClassFolds()
  let thisline = getline(v:lnum)

  if thisline =~ '\v^use'
    return "1"
  elseif thisline =~ '\vconst'
    return "1"
  endif

  " folds properties together

  " folds functions
  if thisline =~ '\v[public|private|protected] function'
    return ">1"
  endif

  if thisline =~ '\v\s{4}.*'
    return "1"
  endif

  if IsBlank(v:lnum) && getline(v:lnum - 1) =~ '\v\s{4}\}'
    return "0"
  endif
endfunction

function! IsBlank(lnumber)
  return getline(lnumber) =~? '\v^\s*$'
endfunction
