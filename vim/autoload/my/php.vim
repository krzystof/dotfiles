function! my#php#namespace()
  let classpath = expand('%:h')

  if classpath =~ '\v^app'
    let normalized = toupper(classpath[0]) . classpath[1,]
  elseif classpath =~ '\v^src'
    let normalized = substitute(classpath, 'src/', '', '')
  endif

  return substitute(normalized, '/', '\', '')
endfunction
