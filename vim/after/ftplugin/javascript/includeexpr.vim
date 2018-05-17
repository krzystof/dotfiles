function! FindNodeModule(name)
  return "node_modules/" . a:name
endfunction

function! ResolveWebpackAlias(fname)
  let project = my#all#GetProject()

  if l:project == 'learning-ladders' && a:fname =~ '^App'
    let relativePath = substitute(a:fname, 'App/', 'jsapp/', '')
    let js = substitute(l:relativePath, '$', '.js', '')
    let jsx = substitute(l:relativePath, '$', '.jsx', '')
    if filereadable(js)
      return l:js
    else
      return l:jsx
    endif
  endif

  if l:project == 'planizely' && a:fname =~ '^App'
    let relativePath = substitute(a:fname, 'App/', 'resources/assets/js/', '')
    let js = substitute(l:relativePath, '$', '.js', '')
    let vue = substitute(l:relativePath, '$', '.vue', '')
    if filereadable(js)
      return l:js
    else
      return l:vue
    endif

  endif

  return FindNodeModule(a:fname)
endfunction

set includeexpr=ResolveWebpackAlias(v:fname)
