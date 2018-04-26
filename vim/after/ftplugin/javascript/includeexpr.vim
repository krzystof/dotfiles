function! FindNodModule(name)
  return "node_modules/" . a:name
endfunction

function! ResolveWebpackAlias(fname)
  "
  " Load aliases by project
  "


  " LearningLadders
  if a:fname =~ '^App'
    let relativePath = substitute(a:fname, 'App/', 'jsapp/', '')
    let js = substitute(l:relativePath, '$', '.js', '')
    let jsx = substitute(l:relativePath, '$', '.jsx', '')
    if filereadable(js)
      return l:js
    else
      return l:jsx
    endif
  else
    return FindNodModule(a:fname)
  endif
endfunction

set includeexpr=ResolveWebpackAlias(v:fname)
