"
" Open a vendor library matching
" the given name.
"
function! my#all#find_deps_docs()
  echom "hoi"
endfunction

function! my#all#GetProject()
  return substitute(expand('%:p'), '\S*\/Code\/\([^\/]*\)\/\S*', '\1', '')
endfunction
