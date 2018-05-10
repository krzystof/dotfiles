function! FindNodModule(name)
  return "node_modules/" . a:name
endfunction

function! ResolveWebpackAlias(fname)
  "
  " Load aliases by project
  "
  echom "This is the filename: " . fname

  if my#IsProject('learning-ladders', fname) && a:fname =~ '^App'
    let relativePath = substitute(a:fname, 'App/', 'jsapp/', '')
    let js = substitute(l:relativePath, '$', '.js', '')
    let jsx = substitute(l:relativePath, '$', '.jsx', '')
    if filereadable(js)
      return l:js
    else
      return l:jsx
    endif
  endif

  return FindNodModule(a:fname)
endfunction

set includeexpr=ResolveWebpackAlias(v:fname)
