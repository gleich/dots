set nospell
augroup TogglePreview
  autocmd!
  autocmd BufDelete * execute 'set spell'
augroup END
