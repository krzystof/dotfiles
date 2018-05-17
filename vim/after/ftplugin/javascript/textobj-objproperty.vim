call textobj#user#plugin('objproperty', {
\   'o': {
\     'select-a-function': 'PropDeclarationA',
\     'select-a': 'ao',
\     'select-i-function': 'PropDeclarationI',
\     'select-i': 'io',
\   },
\ })

function! PropDeclarationA()
  if search('\v\s*\k.*\{$', 'bW')
    let head_pos = getpos('.')
    normal! $%j
    let tail_pos = getpos('.')
    return ['V', head_pos, tail_pos]
  else
    return 0
  endif
endfunction

function! PropDeclarationI()
  if search('\v\s*\k.*\{$', 'bW')
    normal! j
    let head_pos = getpos('.')
    normal! k$%k
    let tail_pos = getpos('.')
    return ['V', head_pos, tail_pos]
  else
    return 0
  endif
endfunction
