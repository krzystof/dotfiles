function! my#php#namespace()"{{{
  let classpath = expand('%:h')
  if l:classpath =~ '\v^app'
    let normalized = toupper(classpath[0]) . classpath[1,]
  elseif l:classpath =~ '\v^src'
    let normalized = substitute(classpath, 'src/', '', '')
  endif

  return substitute(l:normalized, '/', '\', '')
endfunction

function! my#php#classname_from_file()
  let filename = expand('%:t')
  return substitute(filename, '.php', '', '')
endfunction"}}}

function! my#php#functionTextobj(object_type)
  return s:select_{a:object_type}()
endfunction

function! s:select_a()
  if getline('.') =~# '}'
    normal! k
  endif
  normal! ]M$
  let e = getpos('.')

  normal! [m
  call search(')', 'bW')
  normal! %0
  let b = getpos('.')

  if 1 < e[1] - b[1]  " is there some code?
    return ['V', b, e]
  else
    return 0
  endif
endfunction

function! s:select_i()
  let range = s:select_a()
  if range is 0
    return 0
  endif

  let [_, ab, ae] = range

  call setpos('.', ab)
  call search('{', 'W')
  normal! j0
  let ib = getpos('.')

  call setpos('.', ae)
  normal! k$
  let ie = getpos('.')

  if 0 <= ie[1] - ib[1]  " is there some code?
    return ['V', ib, ie]
  else
    return 0
  endif
endfunction
