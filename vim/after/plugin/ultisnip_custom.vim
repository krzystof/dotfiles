if exists(":SkelEdit") || !exists("g:UltiSnipsExpandTrigger") || !has("python") && !has("python3")
  finish
endif

augroup ultisnips_custom
  autocmd!
  autocmd User ProjectionistActivate silent! call snippet#InsertSkeleton()
  autocmd BufNewFile * silent! call snippet#InsertSkeleton()
augroup END
