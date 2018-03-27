function! my#php#namespace()
  let b:classpath = expand('%:h')

  if classpath =~ '\v^app'
    let b:normalized = toupper(classpath[0]) . classpath[1,]
  elseif classpath =~ '\v^src'
    let b:normalized = substitute(classpath, 'src/', '', '')
  endif

  return substitute(normalized, '/', '\', '')
endfunction

function! my#php#classname_from_file()
  let filename = expand('%:t')
  return substitute(filename, '.php', '', '')
endfunction
