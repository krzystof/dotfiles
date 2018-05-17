function! s:NextSection(type, backwards)
  if a:type == 1     " beginning of the section
      let pattern = '\v(public|private|protected) function'
  elseif a:type == 2 " end of the section
      let pattern = '\v\n(public|private|protected)'
  endif

  if a:backwards
      let dir = '?'
  else
      let dir = '/'
  endif

  execute 'silent normal! ' . dir . pattern . "\r"
endfunction

noremap <script> <buffer> <silent> ]]
        \ :call <SID>NextSection(1, 0)<cr>

noremap <script> <buffer> <silent> [[
        \ :call <SID>NextSection(1, 1)<cr>

noremap <script> <buffer> <silent> ][
        \ :call <SID>NextSection(2, 0)<cr>

noremap <script> <buffer> <silent> []
        \ :call <SID>NextSection(2, 1)<cr>
