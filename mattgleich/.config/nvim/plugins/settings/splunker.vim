set nospell
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.py,*.Dockerfile,*.go,*.js,*.ts,*.tsx,*.rs call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.vim,*.json,*.md,*.tex call spelunker#check_displayed_words()
augroup END
