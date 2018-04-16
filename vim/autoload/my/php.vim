function! my#php#namespace()
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
endfunction
