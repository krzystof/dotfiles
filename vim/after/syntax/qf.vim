highlight TestOk    ctermbg=green ctermfg=black
highlight TestError ctermbg=red

syn match TestOk    "^.*OK.*$"
syn match TestError "^.*failure.*$"
syn match TestError "^.*FAILURE.*$"
