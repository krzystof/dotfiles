"
" Infer the tested object from a path
"
" Example:
"   stuff/__tests__/thing.spec.js -> thing
function! my#js#test_file_to_name()
  let filename = expand('%:t')
  return substitute(filename, '.spec.js', '', '')
endfunction